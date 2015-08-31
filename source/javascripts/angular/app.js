(function(){
  angular.module('slides', ['ngAnimate'])

    .controller('SlideController', function ($scope) {
      $scope.slides = [
        {image: 'slides/img00.jpg', description: 'Image 00'},
        {image: 'slides/img01.jpg', description: 'Image 01'},
        {image: 'slides/img02.jpg', description: 'Image 02'},
        {image: 'slides/img03.jpg', description: 'Image 03'},
        {image: 'slides/img04.jpg', description: 'Image 04'},
        {image: 'slides/img05.jpg', description: 'Image 05'},
        {image: 'slides/img06.jpg', description: 'Image 06'},
        {image: 'slides/img07.jpg', description: 'Image 07'},
        {image: 'slides/img08.jpg', description: 'Image 08'},
        {image: 'slides/img09.jpg', description: 'Image 09'},
        {image: 'slides/img10.jpg', description: 'Image 10'},
        {image: 'slides/img11.jpg', description: 'Image 11'},
        {image: 'slides/img12.jpg', description: 'Image 12'},
        {image: 'slides/img13.jpg', description: 'Image 13'},
        {image: 'slides/img14.jpg', description: 'Image 14'},
        {image: 'slides/img15.jpg', description: 'Image 15'},
        {image: 'slides/img16.jpg', description: 'Image 16'},
        {image: 'slides/img17.jpg', description: 'Image 17'},
        {image: 'slides/img18.jpg', description: 'Image 18'}
      ];

      $scope.currentIndex = 0;

      $scope.setCurrentSlideIndex = function (index) {
        $scope.currentIndex = index;
      };

      $scope.isCurrentSlideIndex = function (index) {
        return $scope.currentIndex === index;
      };

      $scope.prevSlide = function () {
        $scope.currentIndex = ($scope.currentIndex < $scope.slides.length - 1) ? ++$scope.currentIndex : 0;
      };

      $scope.nextSlide = function () {
        $scope.currentIndex = ($scope.currentIndex > 0) ? --$scope.currentIndex : $scope.slides.length - 1;
      };

    });


})();