sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'salesorder/ManageSalesOrder/test/integration/FirstJourney',
		'salesorder/ManageSalesOrder/test/integration/pages/SalesOrdersList',
		'salesorder/ManageSalesOrder/test/integration/pages/SalesOrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesOrdersList, SalesOrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('salesorder/ManageSalesOrder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesOrdersList: SalesOrdersList,
					onTheSalesOrdersObjectPage: SalesOrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);