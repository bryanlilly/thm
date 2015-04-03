gulp         = require('gulp')
browserSync  = require('browser-sync')
sass         = require('gulp-sass')
sourcemaps   = require('gulp-sourcemaps')
handleErrors = require('../util/handleErrors')
config       = require('../config').sass
autoprefixer = require('gulp-autoprefixer')
neat 		 = require('node-neat').includePaths
modal		 = require('kbd-modal').includePaths
rename		 = require('gulp-rename')
minify		 = require('gulp-minify-css')

gulp.task 'sass', ->
	return gulp.src('styl/src/screen.scss')
		.pipe(sourcemaps.init())
		.pipe(sass
			sourceComments: 'map'
			imagePath: '/img'
			errLogToConsole: true
			includePaths: ['sass'].concat(neat).concat(modal)
		)
		.pipe(autoprefixer
			browsers: ['last 2 version'] 
		)
		.pipe(sourcemaps.write())
		.on('error', handleErrors)
		.pipe minify()
		.pipe rename 'screen.min.css'
		.pipe(gulp.dest(config.dest))
		.pipe(browserSync.reload({stream:true}))