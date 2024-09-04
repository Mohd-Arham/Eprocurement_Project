var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http, $interval) {
    
    var tick = function() {
       // $scope.clock = Date.now();
         $http.get("FetchServerDate.action")
                .then(function (response) {
              //alert(response.data.time+":"+response.data.date);
                $scope.clock = response.data.time;
                $scope.date = response.data.date;
            });
        };
        tick();
        $interval(tick, 1000);
});


