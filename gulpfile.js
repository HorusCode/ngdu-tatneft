let gulp        = require('gulp'),
    sass        = require('gulp-sass'),
    prefixer    = require('gulp-autoprefixer'),
    gutil       = require('gulp-util' ),
    uglify      = require('gulp-uglify-es').default,
    concat      = require('gulp-concat'),
    cleanCSS    = require('clean-css'),
    cssmin      = require('gulp-minify-css'),
    rename      = require('gulp-rename'),
    browserSync = require("browser-sync").create(),
    reload      = browserSync.reload;


gulp.task('browser-sync', function () {
    browserSync.init({
        proxy: 'ngdu',
        notify: false
    });
});

gulp.task('js', function() {
    return gulp.src([
        /*'app/assets/libs/!**!/!*.js',*/
        'app/assets/js/script.js', // Всегда в конце
    ])
        .pipe(rename({suffix: '.min', prefix: ''}))
        .pipe(uglify())
        .pipe(gulp.dest('app/assets/js'))
        .pipe(reload({stream: true}));
});

gulp.task('styles', function () {
   return gulp.src('app/assets/sass/*.sass')
       .pipe(sass({
           includePaths: require('node-bourbon').includePaths
       }).on('error', sass.logError))
       .pipe(rename({suffix: '.min', prefix: ''}))
       .pipe(prefixer({browsers: ['last 15 versions'], cascade: false}))
       .pipe(cssmin())
       .pipe(gulp.dest('app/assets/css'))
       .pipe(reload({stream: true}));
});



gulp.task('watch',['styles', 'js','browser-sync'], function () {
   gulp.watch(['app/assets/sass/*.sass', 'app/assets/libs/**/*.css'],['styles']);
   gulp.watch(['app/assets/libs/**/*.js','app/assets/js/*.js'],['js']);
   gulp.watch('app/**/*.php', reload);
});

gulp.task('default',['watch']);