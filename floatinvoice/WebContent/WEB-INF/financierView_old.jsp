<!DOCTYPE html>
<html >
<head>
  <title>Float Invoice - Accelerate Cashflow</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/angular-material.min.css">

  <style>
    table, th , td  {
      /*border: 1px solid grey;*/
      border-collapse: collapse;
      padding: 10px;
    }
    table tr:nth-child(odd) {
      background-color: #f1f1f1;
    }
    table tr:nth-child(even) {
      background-color: #ffffff;
    }
</style>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/angular.min.js"></script>
  <script src="js/angular-animate.min.js"></script>
  <script src="js/angular-aria.min.js"></script>
  <script src="js/angular-messages.min.js"></script>
  <!-- Angular Material Library -->
  <script src="js/angular-material.min.js"></script>
<script src="https://rawgit.com/dwmkerr/angular-modal-service/master/dst/angular-modal-service.js"></script>
  <script src="js/moment.js"></script>

  <script src="js/dirPagination.js"></script>
  <script src="js/angular-route.min.js"></script>
  <script src="js/appFinancierView.js"></script>
  <script src="js/finInvoiceListView.js"></script>
  <script src="js/finApprovalQueueView.js"></script>
  <script src="js/finFundedListView.js" ></script>

  <script>
    finfloatInvoiceListApp.service('acroNameService', function(){
      this.getAcronym = function(){
        return "${acronym}";
      };
    });
    finfloatInvoiceListApp.controller('TabsCtrl2', ['$scope', '$location', 
      function ($scope, $location) {

      $scope.tabs = [
          { link : '#/list', label : 'Pending' },
          { link : '#/approve', label: 'Approval Queue'},
          { link : '#/funded', label : 'Funded' },
          { link : '#/repaid', label : 'RePaid' }
        ];     
      var index = -1;
      var tabList =  $scope.tabs;
      for (var i=0; i<tabList.length; i++){
        if( tabList[i].link == '#'+$location.url() ) {
            index = i;
            break;
        }
      }
      $scope.selectedTab = $scope.tabs[index];

      $scope.setSelectedTab = function(tab) {
        $scope.selectedTab = tab;
      }
      $scope.tabClass = function(tab) {
        if ($scope.selectedTab == tab) {
          return "active";
        } else {
          return "";
        }
      }
    }]);

  </script>
</head>
<body>

<div class="container">
    <br/>
    <br/>
    <div class="row">  
      <div class="col-sm-7">
          <img src = "img/logo.jpg" height=65/>                 
      </div>
      <div class="col-sm-5 well well-sm">
          <label> Welcome ${acronym} </label>
          <span style="float:right">
            <a href="/floatinvoice/logout" class="btn btn-primary" title="Logout" data-toggle="tooltip" >
            <span class="glyphicon glyphicon-log-out"></span></a>
          </span>
      </div>
    </div>
    <ul class="nav nav-tabs nav-pills nav-justified" ng-controller="TabsCtrl2">
      <li ng-class="tabClass(tab)" ng-repeat="tab in tabs" tab="tab"><a href="{{tab.link}}" ng-click="setSelectedTab(tab)">{{tab.label}}</a></li>
    </ul>
    <br/>
    <div ng-view></div>
  </div>
</div>
    
</body>
</html>
