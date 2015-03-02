browserify   = require 'browserify'
browserSync  = require 'browser-sync'
# watchify     = require 'watchify'
bundleLogger = require '../util/bundleLogger'
gulp         = require 'gulp'
handleErrors = require '../util/handleErrors'
source       = require 'vinyl-source-stream'
config       = require('../config').browserify
rename		 = require 'gulp-rename'
_            = require 'lodash'

browserifyTask = (callback, devMode) ->

	bundleQueue = config.bundleConfigs.length

	browserifyThis = (bundleConfig) ->

		if devMode
			_.extend bundleConfig, watchify.args, debug: true
			bundleConfig = _.omit bundleConfig, ['external', 'require']

		b = browserify(bundleConfig)

		bundle = ->
			bundleLogger.start(bundleConfig.outputName)

			return b
				.bundle()
				.on 'error', handleErrors
				.pipe(source(bundleConfig.outputName))
				.pipe rename 'bld.min.js'
				.pipe(gulp.dest(bundleConfig.dest))
				.on 'end', reportFinished
				.pipe(browserSync.reload
					stream: true
				)

		# b = watchify(b)
		# b.on 'update', bundle
		# bundleLogger.watch(bundleConfig.outputName)

		reportFinished = ->
			bundleLogger.end(bundleConfig.outputName)

			if bundleQueue
				bundleQueue--
				if bundleQueue is 0
					callback()
					return

		return bundle()

	config.bundleConfigs.forEach(browserifyThis)

gulp.task 'browserify', browserifyTask

module.exports = browserifyTask