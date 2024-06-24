//AngularJS Module Definition:creates an AngularJS module named "getAccountsApp."
var app = angular.module("getAccountsApp", []);
app.controller('getAccountsCtrl', function($scope) {
    $scope.accounts = [];
    $scope.displayAccounts = function() {
        AccountObjcontroller.getAccounts(function(result, event) {
            if (event.status && result) {
                $scope.accounts = result;
            } else {
                console.log('Error Fetching Values', event.message);
            }
            $scope.$apply(); //when communiting with apex
        });
    };
        $scope.displayAccounts();
    
    //for save button
    $scope.save = function(){
        debugger;
        for(var i=0; i<$scope.accounts.length; i++){  //haskey value remove 
            delete ($scope.accounts[i]['$$hashKey']);
        }
        
        
    AccountObjcontroller.updateAccounts($scope.accounts, function(result, event) {
        debugger;
        if (event.status) {
            //Showtoast message
            alert('SUCCESS');
             $window.location.reload();
           
        } else {
            console.error('Error fetching values:', event.message);
         
        }
    });
}
});
