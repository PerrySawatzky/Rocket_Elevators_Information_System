
var theForm = document.forms['quoteForm_'];

function getBuildingType(){
	var theForm = document.forms['quoteForm_'];
    var selectedBuildingType = theForm.elements['building-type'];
		if(selectedBuildingType.value==='residential1'){
			document.getElementById('resultsInputsIDResidential').value = "";
			document.getElementById('numberOfApartmentsResidential').value = "";
			document.getElementById('numberOfFloorsResidential').value = "";
			document.getElementById('numberOfBasementsResidential').value = "";
			document.getElementById('result-ElevatorAmount').innerHTML = "0";
			document.getElementById('result-ElevatorUnit').innerHTML = "0.00";
			document.getElementById('result-ElevatorPrice').innerHTML = "0.00";
			document.getElementById('result-ElevatorFees').innerHTML = "0.00";
			document.getElementById('result-FinalPrice').innerHTML = "0.00";
		}if(selectedBuildingType.value==='commercial1'){
			document.getElementById('resultsInputsIDCommercial').value = "";
			document.getElementById('numberOfFloorsCommercial').value = "";
			document.getElementById('numberOfBasementsCommercial').value = "";
			document.getElementById('numberOfCompaniesCommercial').value = "";
			document.getElementById('numberOfParkingSpotsCommercial').value = "";
			document.getElementById('numberOfElevatorsCommercial').value = "";
			document.getElementById('result-ElevatorAmount').innerHTML = "0";
			document.getElementById('result-ElevatorUnit').innerHTML = "0.00";
			document.getElementById('result-ElevatorPrice').innerHTML = "0.00";
			document.getElementById('result-ElevatorFees').innerHTML = "0.00";
			document.getElementById('result-FinalPrice').innerHTML = "0.00";
		}if(selectedBuildingType.value==='corporate1'){
			document.getElementById('resultsInputsIDCorporate').value = "";
			document.getElementById('numberOfFloorsCorporate').value = "";
			document.getElementById('numberOfBasementsCorporate').value = "";
			document.getElementById('numberOfParkingSpotsCorporate').value = "";
			document.getElementById('numberOfCorporationsCorporate').value = "";
			document.getElementById('maximumOccupancyCorporate').value = "";
			document.getElementById('result-ElevatorAmount').innerHTML = "0";
			document.getElementById('result-ElevatorUnit').innerHTML = "0.00";
			document.getElementById('result-ElevatorPrice').innerHTML = "0.00";
			document.getElementById('result-ElevatorFees').innerHTML = "0.00";
			document.getElementById('result-FinalPrice').innerHTML = "0.00";
		}if(selectedBuildingType.value==='hybrid1'){
			document.getElementById('resultsInputsIDHybrid').value = "";
			document.getElementById('numberOfFloorsHybrid').value = "";
			document.getElementById('numberOfBasementsHybrid').value = "";
			document.getElementById('numberOfParkingSpotsHybrid').value = "";
			document.getElementById('numberOfCompaniesHybrid').value = "";
			document.getElementById('maximumOccupancyHybrid').value = "";
			document.getElementById('businessHoursHybrid').value = "";
			document.getElementById('result-ElevatorAmount').innerHTML = "0";
			document.getElementById('result-ElevatorUnit').innerHTML = "0.00";
			document.getElementById('result-ElevatorPrice').innerHTML = "0.00";
			document.getElementById('result-ElevatorFees').innerHTML = "0.00";
			document.getElementById('result-FinalPrice').innerHTML = "0.00";
		}
}

var productLinePrice = new Array();
    productLinePrice['standard']=7565;
    productLinePrice['premium']=12345;
    productLinePrice['excelium']=15400;
	//Residential functions below
	function getProductLinePrice() {
    var productLinePremium=0;
    var theForm = document.forms['quoteForm_'];
    var selectedID = theForm.elements['resultsInputsIDResidential'];
	productLinePremium = productLinePrice[selectedID.value];
	return productLinePremium;
}
function getElevatorUnitPrice(){
	var productLineValue=0;
    var theForm = document.forms['quoteForm_'];
    var selectedID = theForm.elements['resultsInputsIDResidential'];
	productLineValue = productLinePrice[selectedID.value];
	document.getElementById('result-ElevatorUnit').innerHTML = (productLineValue.formatMoney(2, '.', ','));
}
function getApartmentNumber(){
    var theForm = document.forms['quoteForm_'];
    var numberOfApartmentsResidential = theForm.elements['numberOfApartmentsResidential'];
    var howmany = 0;
    if(numberOfApartmentsResidential.value!=''){
        howmany = parseInt(numberOfApartmentsResidential.value);
    }
    return parseInt(howmany);
}
function getFloorNumber(){
    var theForm = document.forms['quoteForm_'];
    var numberOfFloorsResidential = theForm.elements['numberOfFloorsResidential'];
    var howmany = 0;
    if(numberOfFloorsResidential.value!=''){
        howmany = parseInt(numberOfFloorsResidential.value);
    }
    return parseInt(howmany);
}
function getElevatorAmount(){
    var avgDoorsPerFloor = getApartmentNumber() / getFloorNumber();
    var elevatorPerColumn = Math.ceil(avgDoorsPerFloor / 6);
    var elevatorColumns = Math.ceil(getFloorNumber() / 20);
    var elevatorTotal = elevatorPerColumn * elevatorColumns;
	if(isNaN(elevatorTotal)||elevatorTotal < 0){
		document.getElementById('result-ElevatorAmount').innerHTML = 0;
	}else{
    document.getElementById('result-ElevatorAmount').innerHTML = elevatorTotal;
	}
}
function getInstallationFees(){
	var installationFees = 0;
	var theForm = document.forms['quoteForm_'];
	var avgDoorsPerFloor = getApartmentNumber() / getFloorNumber();
    var elevatorPerColumn = Math.ceil(avgDoorsPerFloor / 6);
    var elevatorColumns = Math.ceil(getFloorNumber() / 20);
    var elevatorTotal = elevatorPerColumn * elevatorColumns;
	var productLineInstall = new Array();
    productLineInstall['standard']=756.5;
    productLineInstall['premium']=1604.85;
    productLineInstall['excelium']=2464.0;
    var selectedID = theForm.elements['resultsInputsIDResidential'];
	productLineInstall = productLineInstall[selectedID.value];
	productLineInstall = (productLineInstall * elevatorTotal);
		if(productLineInstall < 0){
			document.getElementById('result-ElevatorFees').innerHTML = "0.00";
		}else{
	document.getElementById('result-ElevatorFees').innerHTML = (productLineInstall.formatMoney(2, '.', ','));
		}
}
function getElevatorTotalPrice(){
    var avgDoorsPerFloor = getApartmentNumber() / getFloorNumber();
    var elevatorPerColumn = Math.ceil(avgDoorsPerFloor / 6);
    var elevatorColumns = Math.ceil(getFloorNumber() / 20);
    var elevatorTotal = elevatorPerColumn * elevatorColumns;
	var elevatorTotalPrice = getProductLinePrice() * elevatorTotal;
	if(elevatorTotalPrice < 0){
		document.getElementById('result-ElevatorPrice').innerHTML = "0.00";
	}else{
    document.getElementById('result-ElevatorPrice').innerHTML = (elevatorTotalPrice.formatMoney(2, '.', ','));
	}
}
function getFinalPrice(){
	var finalPrice = 0;
	var avgDoorsPerFloor = getApartmentNumber() / getFloorNumber();
    var elevatorPerColumn = Math.ceil(avgDoorsPerFloor / 6);
    var elevatorColumns = Math.ceil(getFloorNumber() / 20);
    var elevatorTotal = elevatorPerColumn * elevatorColumns;
	var productLineInstall = new Array();
    productLineInstall['standard']=756.5;
    productLineInstall['premium']=1604.85;
    productLineInstall['excelium']=2464.0;
    var selectedID = theForm.elements['resultsInputsIDResidential'];
	productLineInstall = productLineInstall[selectedID.value];
	productLineInstall = (productLineInstall * elevatorTotal);
	finalPrice = (elevatorTotal * getProductLinePrice())+productLineInstall;
	if(finalPrice < 0){
		document.getElementById('result-FinalPrice').innerHTML = "0.00";
	}else{
	document.getElementById('result-FinalPrice').innerHTML = (finalPrice.formatMoney(2, '.', ','));
	}
}
//commercial functions below

function getCommercialElevatorUnitPrice(){
	var productLineValueCom=0;
    var theForm = document.forms['quoteForm_'];
    var selectedIDCom = theForm.elements['resultsInputsIDCommercial'];
	productLineValueCom = productLinePrice[selectedIDCom.value];
	document.getElementById('result-ElevatorUnit').innerHTML = (productLineValueCom.formatMoney(2, '.', ','));
}
function getElevatorAmountCom(){
	var theForm = document.forms['quoteForm_'];
    var elevatorAmountCom = theForm.elements['numberOfElevatorsCommercial'];
	var howmanyCom = 0;
    if(numberOfElevatorsCommercial.value!=''){
        howmanyCom = parseInt(numberOfElevatorsCommercial.value);
    }
    return parseInt(howmanyCom);
}
function getElevatorAmountCom2(){
	var elevatorAmountCom = getElevatorAmountCom();
	if(isNaN(elevatorAmountCom)||elevatorAmountCom < 0){
		document.getElementById('result-ElevatorAmount').innerHTML = 0;
	}else{
	document.getElementById('result-ElevatorAmount').innerHTML = elevatorAmountCom;
	}
}
function getElevatorTotalPriceCom(){
    var elevatorTotalPriceCom = 0;
	var theForm = document.forms['quoteForm_'];
    var elevatorAmountCom = theForm.elements['numberOfElevatorsCommercial'];
	var howmanyCom1 = 0;
        howmanyCom1 = parseInt(numberOfElevatorsCommercial.value);
	var productLineValueCom1=0;
    var theForm = document.forms['quoteForm_'];
    var selectedIDCom = theForm.elements['resultsInputsIDCommercial'];
	productLineValueCom1 = productLinePrice[selectedIDCom.value];
	var elevatorTotalPriceCom = (productLineValueCom1 * howmanyCom1);
	if(elevatorTotalPriceCom < 0){
		document.getElementById('result-ElevatorPrice').innerHTML = "0.00";
	}else{
    document.getElementById('result-ElevatorPrice').innerHTML = (elevatorTotalPriceCom.formatMoney(2, '.', ','));
	}
}
function getInstallationFeesCom(){
	var installationFeesCom = 0;
	var theForm = document.forms['quoteForm_'];
	var elevatorAmountCom = getElevatorAmountCom();
	var productLineInstallCom = new Array();
    productLineInstallCom['standard']=756.5;
    productLineInstallCom['premium']=1604.85;
    productLineInstallCom['excelium']=2464.0;
	var selectedIDCom1 = theForm.elements['resultsInputsIDCommercial'];
	productLineInstallCom = productLineInstallCom[selectedIDCom1.value];
	productLineInstallCom = (productLineInstallCom * elevatorAmountCom);
	if(productLineInstallCom < 0){
		document.getElementById('result-ElevatorFees').innerHTML = "0.00";
	}else{
	document.getElementById('result-ElevatorFees').innerHTML = (productLineInstallCom.formatMoney(2, '.', ','));
	}
}
function getFinalPriceCom(){
	var finalPriceCom = 0;
	var installationFeesCom = 0;
	var theForm = document.forms['quoteForm_'];
	var elevatorAmountCom = getElevatorAmountCom();
	var productLineInstallCom = new Array();
    productLineInstallCom['standard']=756.5;
    productLineInstallCom['premium']=1604.85;
    productLineInstallCom['excelium']=2464.0;
	var selectedIDCom1 = theForm.elements['resultsInputsIDCommercial'];
	productLineInstallCom = productLineInstallCom[selectedIDCom1.value];
	productLineInstallCom = (productLineInstallCom * elevatorAmountCom);
	var elevatorTotalPriceCom = 0;
	var theForm = document.forms['quoteForm_'];
    var elevatorAmountCom = theForm.elements['numberOfElevatorsCommercial'];
	var howmanyCom1 = 0;
        howmanyCom1 = parseInt(numberOfElevatorsCommercial.value);
	var productLineValueCom1=0;
    var theForm = document.forms['quoteForm_'];
    var selectedIDCom = theForm.elements['resultsInputsIDCommercial'];
	productLineValueCom1 = productLinePrice[selectedIDCom.value];
	var elevatorTotalPriceCom = (productLineValueCom1 * howmanyCom1);
	var finalPriceCom = elevatorTotalPriceCom + productLineInstallCom;
	if(finalPriceCom < 0){
		document.getElementById('result-FinalPrice').innerHTML = "0.00";
	}else{
	document.getElementById('result-FinalPrice').innerHTML = (finalPriceCom.formatMoney(2, '.', ','));
	}
}
//Corporate Functions Below
function getElevatorAmountCorp(){
	var elevatorAmountCorp = 0;
	var elevatorPerColumn = 0;
	var elevatorsRequired = 0;
	var basementFloorNumber = 0;
	var maxOccupancy = 0;
	var totalOccupants = 0;
	var elevatorsPerColumn = 0;
	var theForm = document.forms['quoteForm_'];
    var numberOfBasements = theForm.elements['numberOfBasementsCorporate'];
	var numberOfFloorsCorporate = theForm.elements['numberOfFloorsCorporate'];
	maxOccupancy = theForm.elements['maximumOccupancyCorporate'];
    numberOfBasements = parseInt(numberOfBasements.value);
	numberOfFloorsCorporate = parseInt(numberOfFloorsCorporate.value);
	basementFloorNumber = (numberOfBasements + numberOfFloorsCorporate);
    maxOccupancy = parseInt(maxOccupancy.value);
	totalOccupants = basementFloorNumber * maxOccupancy;
	elevatorsRequired = Math.ceil(totalOccupants / 1000);
	elevatorColumns = Math.ceil(basementFloorNumber / 20);
	elevatorPerColumn = Math.ceil(elevatorsRequired / elevatorColumns);
	elevatorAmountCorp = elevatorPerColumn * elevatorColumns;
	if(isNaN(elevatorAmountCorp)||elevatorAmountCorp < 0){
		document.getElementById('result-ElevatorAmount').innerHTML = 0;
	}else{
	document.getElementById('result-ElevatorAmount').innerHTML = elevatorAmountCorp;
	}
}
function getCorporateElevatorUnitPrice(){
	var productLineValueCorp = 0;
	var theForm = document.forms['quoteForm_'];
	var selectedIDCorp = theForm.elements['resultsInputsIDCorporate'];
	productLineValueCorp = productLinePrice[selectedIDCorp.value];
	document.getElementById('result-ElevatorUnit').innerHTML = (productLineValueCorp.formatMoney(2, '.', ','));
}
function getElevatorTotalPriceCorp(){
	var elevatorTotalPriceCorp = 0;
	var elevatorAmountCorp = 0;
	var elevatorPerColumn = 0;
	var elevatorColumns = 0;
	var basementFloorNumber = 0;
	var maxOccupancy = 0;
	var totalOccupants = 0;
	var productLineValueCorp = 0;
	var theForm = document.forms['quoteForm_'];
    var numberOfBasements = theForm.elements['numberOfBasementsCorporate'];
	var numberOfFloorsCorporate = theForm.elements['numberOfFloorsCorporate'];
	maxOccupancy = theForm.elements['maximumOccupancyCorporate'];
    numberOfBasements = parseInt(numberOfBasements.value);
	numberOfFloorsCorporate = parseInt(numberOfFloorsCorporate.value);
	basementFloorNumber = (numberOfBasements + numberOfFloorsCorporate);
    maxOccupancy = parseInt(maxOccupancy.value);
	totalOccupants = basementFloorNumber * maxOccupancy;
	elevatorsRequired = Math.ceil(totalOccupants / 1000);
	elevatorColumns = Math.ceil(basementFloorNumber / 20);
	elevatorPerColumn = Math.ceil(elevatorsRequired / elevatorColumns);
	elevatorAmountCorp = elevatorPerColumn * elevatorColumns;
    var selectedIDCorp = theForm.elements['resultsInputsIDCorporate'];
	productLineValueCorp = productLinePrice[selectedIDCorp.value];
	elevatorTotalPriceCorp = (productLineValueCorp * elevatorAmountCorp);
	if(elevatorTotalPriceCorp < 0){
		document.getElementById('result-ElevatorPrice').innerHTML = "0.00";
	}else{
    document.getElementById('result-ElevatorPrice').innerHTML = (elevatorTotalPriceCorp.formatMoney(2, '.', ','));
	}
}
function getInstallationFeesCorp(){
	var elevatorAmountCorp = 0;
	var elevatorPerColumn = 0;
	var elevatorColumns = 0;
	var basementFloorNumber = 0;
	var maxOccupancy = 0;
	var totalOccupants = 0;
	var theForm = document.forms['quoteForm_'];
    var numberOfBasements = theForm.elements['numberOfBasementsCorporate'];
	var numberOfFloorsCorporate = theForm.elements['numberOfFloorsCorporate'];
	maxOccupancy = theForm.elements['maximumOccupancyCorporate'];
    numberOfBasements = parseInt(numberOfBasements.value);
	numberOfFloorsCorporate = parseInt(numberOfFloorsCorporate.value);
	basementFloorNumber = (numberOfBasements + numberOfFloorsCorporate);
    maxOccupancy = parseInt(maxOccupancy.value);
	totalOccupants = basementFloorNumber * maxOccupancy;
	elevatorsRequired = Math.ceil(totalOccupants / 1000);
	elevatorColumns = Math.ceil(basementFloorNumber / 20);
	elevatorPerColumn = Math.ceil(elevatorsRequired / elevatorColumns);
	elevatorAmountCorp = elevatorPerColumn * elevatorColumns;
	var productLineInstallCorp = new Array();
    productLineInstallCorp['standard']=756.5;
    productLineInstallCorp['premium']=1604.85;
    productLineInstallCorp['excelium']=2464.0;
	var selectedIDCorp1 = theForm.elements['resultsInputsIDCorporate'];
	productLineInstallCorp = productLineInstallCorp[selectedIDCorp1.value];
	productLineInstallCorp = (productLineInstallCorp * elevatorAmountCorp);
	if(productLineInstallCorp < 0){
		document.getElementById('result-ElevatorFees').innerHTML = "0.00";
	}else{
	document.getElementById('result-ElevatorFees').innerHTML = (productLineInstallCorp.formatMoney(2, '.', ','));
	}
}
function getFinalPriceCorp(){
	var finalPriceCorp = 0;
	var elevatorAmountCorp = 0;
	var elevatorPerColumn = 0;
	var elevatorColumns = 0;
	var basementFloorNumber = 0;
	var maxOccupancy = 0;
	var totalOccupants = 0;
	var elevatorTotalPriceCorp = 0;
	var theForm = document.forms['quoteForm_'];
    var numberOfBasements = theForm.elements['numberOfBasementsCorporate'];
	var numberOfFloorsCorporate = theForm.elements['numberOfFloorsCorporate'];
	maxOccupancy = theForm.elements['maximumOccupancyCorporate'];
    numberOfBasements = parseInt(numberOfBasements.value);
	numberOfFloorsCorporate = parseInt(numberOfFloorsCorporate.value);
	basementFloorNumber = (numberOfBasements + numberOfFloorsCorporate);
    maxOccupancy = parseInt(maxOccupancy.value);
	totalOccupants = basementFloorNumber * maxOccupancy;
	elevatorsRequired = Math.ceil(totalOccupants / 1000);
	elevatorColumns = Math.ceil(basementFloorNumber / 20);
	elevatorPerColumn = Math.ceil(elevatorsRequired / elevatorColumns);
	elevatorAmountCorp = elevatorPerColumn * elevatorColumns;
	var productLineInstallCorp = new Array();
    productLineInstallCorp['standard']=756.5;
    productLineInstallCorp['premium']=1604.85;
    productLineInstallCorp['excelium']=2464.0;
	var selectedIDCorp1 = theForm.elements['resultsInputsIDCorporate'];
	productLineInstallCorp = productLineInstallCorp[selectedIDCorp1.value];
	productLineInstallCorp = (productLineInstallCorp * elevatorAmountCorp);
    var selectedIDCorp = theForm.elements['resultsInputsIDCorporate'];
	productLineValueCorp = productLinePrice[selectedIDCorp.value];
	elevatorTotalPriceCorp = (productLineValueCorp * elevatorAmountCorp);
	finalPriceCorp = elevatorTotalPriceCorp + productLineInstallCorp;
	if(finalPriceCorp < 0){
		document.getElementById('result-FinalPrice').innerHTML = "0.00";
	}else{
	document.getElementById('result-FinalPrice').innerHTML = (finalPriceCorp.formatMoney(2, '.', ','));
	}
}
//Hybrid Functions Below
function getElevatorAmountHybrid(){
	var elevatorAmountHybrid = 0;
	var elevatorPerColumn = 0;
	var elevatorColumns = 0;
	var basementFloorNumber = 0;
	var maxOccupancy = 0;
	var totalOccupants = 0;
	var theForm = document.forms['quoteForm_'];
    var numberOfBasements = theForm.elements['numberOfBasementsHybrid'];
	var numberOfFloorsHybrid = theForm.elements['numberOfFloorsHybrid'];
	maxOccupancy = theForm.elements['maximumOccupancyHybrid'];
    numberOfBasements = parseInt(numberOfBasements.value);
	numberOfFloorsHybrid = parseInt(numberOfFloorsHybrid.value);
	basementFloorNumber = (numberOfBasements + numberOfFloorsHybrid);
    maxOccupancy = parseInt(maxOccupancy.value);
	totalOccupants = basementFloorNumber * maxOccupancy;
	elevatorsRequired = Math.ceil(totalOccupants / 1000);
	elevatorColumns = Math.ceil(basementFloorNumber / 20);
	elevatorPerColumn = Math.ceil(elevatorsRequired / elevatorColumns);
	elevatorAmountHybrid = elevatorPerColumn * elevatorColumns;
		if(isNaN(elevatorAmountHybrid)||elevatorAmountHybrid < 0){
			document.getElementById('result-ElevatorAmount').innerHTML = 0;
		}else{
	document.getElementById('result-ElevatorAmount').innerHTML = elevatorAmountHybrid;
		}
}
function getHybridElevatorUnitPrice(){
	var productLineValueHybrid = 0;
	var theForm = document.forms['quoteForm_'];
	var selectedIDHybrid = theForm.elements['resultsInputsIDHybrid'];
	productLineValueHybrid = productLinePrice[selectedIDHybrid.value];
	document.getElementById('result-ElevatorUnit').innerHTML = (productLineValueHybrid.formatMoney(2, '.', ','));
}
function getElevatorTotalPriceHybrid(){
	var elevatorTotalPriceHybrid = 0;
	var elevatorAmountHybrid = 0;
	var elevatorPerColumn = 0;
	var elevatorColumns = 0;
	var basementFloorNumber = 0;
	var maxOccupancy = 0;
	var totalOccupants = 0;
	var productLineValueHybrid = 0;
	var theForm = document.forms['quoteForm_'];
    var numberOfBasements = theForm.elements['numberOfBasementsHybrid'];
	var numberOfFloorsHybrid = theForm.elements['numberOfFloorsHybrid'];
	maxOccupancy = theForm.elements['maximumOccupancyHybrid'];
    numberOfBasements = parseInt(numberOfBasements.value);
	numberOfFloorsHybrid = parseInt(numberOfFloorsHybrid.value);
	basementFloorNumber = (numberOfBasements + numberOfFloorsHybrid);
    maxOccupancy = parseInt(maxOccupancy.value);
	totalOccupants = basementFloorNumber * maxOccupancy;
	elevatorsRequired = Math.ceil(totalOccupants / 1000);
	elevatorColumns = Math.ceil(basementFloorNumber / 20);
	elevatorPerColumn = Math.ceil(elevatorsRequired / elevatorColumns);
	elevatorAmountHybrid = elevatorPerColumn * elevatorColumns;
    var selectedIDHybrid = theForm.elements['resultsInputsIDHybrid'];
	productLineValueHybrid = productLinePrice[selectedIDHybrid.value];
	elevatorTotalPriceHybrid = (productLineValueHybrid * elevatorAmountHybrid);
	if(elevatorTotalPriceHybrid < 0){
		document.getElementById('result-ElevatorPrice').innerHTML = "0.00";
	}else{
    document.getElementById('result-ElevatorPrice').innerHTML = (elevatorTotalPriceHybrid.formatMoney(2, '.', ','));
	}
}
function getInstallationFeesHybrid(){
	var elevatorAmountHybrid = 0;
	var elevatorPerColumn = 0;
	var elevatorColumns = 0;
	var basementFloorNumber = 0;
	var maxOccupancy = 0;
	var totalOccupants = 0;
	var theForm = document.forms['quoteForm_'];
    var numberOfBasements = theForm.elements['numberOfBasementsHybrid'];
	var numberOfFloorsHybrid = theForm.elements['numberOfFloorsHybrid'];
	maxOccupancy = theForm.elements['maximumOccupancyHybrid'];
    numberOfBasements = parseInt(numberOfBasements.value);
	numberOfFloorsHybrid = parseInt(numberOfFloorsHybrid.value);
	basementFloorNumber = (numberOfBasements + numberOfFloorsHybrid);
    maxOccupancy = parseInt(maxOccupancy.value);
	totalOccupants = basementFloorNumber * maxOccupancy;
	elevatorsRequired = Math.ceil(totalOccupants / 1000);
	elevatorColumns = Math.ceil(basementFloorNumber / 20);
	elevatorPerColumn = Math.ceil(elevatorsRequired / elevatorColumns);
	elevatorAmountHybrid = elevatorPerColumn * elevatorColumns;
	var productLineInstallHybrid = new Array();
    productLineInstallHybrid['standard']=756.5;
    productLineInstallHybrid['premium']=1604.85;
    productLineInstallHybrid['excelium']=2464.0;
	var selectedIDHybrid1 = theForm.elements['resultsInputsIDHybrid'];
	productLineInstallHybrid = productLineInstallHybrid[selectedIDHybrid1.value];
	productLineInstallHybrid = (productLineInstallHybrid * elevatorAmountHybrid);
	if(productLineInstallHybrid < 0){
		document.getElementById('result-ElevatorFees').innerHTML = "0.00";
	}else{
	document.getElementById('result-ElevatorFees').innerHTML = (productLineInstallHybrid.formatMoney(2, '.', ','));
	}
}
function getFinalPriceHybrid(){
	var finalPriceHybrid = 0;
	var elevatorAmountHybrid = 0;
	var elevatorPerColumn = 0;
	var elevatorColumns = 0;
	var basementFloorNumber = 0;
	var maxOccupancy = 0;
	var totalOccupants = 0;
	var elevatorTotalPriceHybrid = 0;
	var theForm = document.forms['quoteForm_'];
    var numberOfBasements = theForm.elements['numberOfBasementsHybrid'];
	var numberOfFloorsHybrid = theForm.elements['numberOfFloorsHybrid'];
	maxOccupancy = theForm.elements['maximumOccupancyHybrid'];
    numberOfBasements = parseInt(numberOfBasements.value);
	numberOfFloorsHybrid = parseInt(numberOfFloorsHybrid.value);
	basementFloorNumber = (numberOfBasements + numberOfFloorsHybrid);
    maxOccupancy = parseInt(maxOccupancy.value);
	totalOccupants = basementFloorNumber * maxOccupancy;
	elevatorsRequired = Math.ceil(totalOccupants / 1000);
	elevatorColumns = Math.ceil(basementFloorNumber / 20);
	elevatorPerColumn = Math.ceil(elevatorsRequired / elevatorColumns);
	elevatorAmountHybrid = elevatorPerColumn * elevatorColumns;
	var productLineInstallHybrid = new Array();
    productLineInstallHybrid['standard']=756.5;
    productLineInstallHybrid['premium']=1604.85;
    productLineInstallHybrid['excelium']=2464.0;
	var selectedIDHybrid1 = theForm.elements['resultsInputsIDHybrid'];
	productLineInstallHybrid = productLineInstallHybrid[selectedIDHybrid1.value];
	productLineInstallHybrid = (productLineInstallHybrid * elevatorAmountHybrid);
    var selectedIDHybrid = theForm.elements['resultsInputsIDHybrid'];
	productLineValueHybrid = productLinePrice[selectedIDHybrid.value];
	elevatorTotalPriceHybrid = (productLineValueHybrid * elevatorAmountHybrid);
	finalPriceHybrid = elevatorTotalPriceHybrid + productLineInstallHybrid;
	if(finalPriceHybrid < 0){
		document.getElementById('result-FinalPrice').innerHTML = "0.00";
	}else{
	document.getElementById('result-FinalPrice').innerHTML = (finalPriceHybrid.formatMoney(2, '.', ','));
	}
}
$(document).ready(function(){
    $('.building_type').hide();

    $('#building-type').change(function(){
        $('.building_type').hide();
        $('#'+$(this).val()).show();
    })
})


/*
 Perry's playground
ok lets start with residential.
    1) "number-of-apartments" / "number-of-floors" = "average-doors-per-floor". 
    2) "average-doors-per-floor" / 6 = "elevator-per-column" (Round up to nearest int)
    3) "number-of-floors" / 20 = "elevator-columns" (Round up to nearest int)  
    4) "elevator-per-column" * "elevator-columns" = "elevator-amount"
     
Now its commercials turn.
    "elevator-amount" is equal to "number-of-elevators"

For corporate and hybrid
    "maximum-occupancy" multiplied by ("number-of-floors" + "number-of-basements") is "total-occupants".
    "total-occupants" divided by 1000 is "elevator-per-column". Round up to int.
    ("number-of-floors" + "number-of-basements") divided by twenty is "elevator-columns". Rounded up to nearest int.
    "elevators-per-column" * "elevator-columns" is "elevator-amount".

Budget

    "elevator-total-price" = "elevator-amount" * "elevator-unit-price"
    
    "final-price" = "elevator-total-price" * "installation-fees"

    "elevator-unit-price" is 
        If productLineID = "standard" then "elevator-unit-price" = 7565
        If productLineID = "premium" then "elevator-unit-price" = 12345
        If productLineID = "excelium" then "elevator-unit-price" = 15400

    "installation-fees" is
        If productLineID = "standard" then "installation-fees" = 1.1
        If productLineID = "premium" then "installation-fees" = 1.13
        If productLineID = "excelium" then "installation-fees" = 1.16


Example of residential
    "number-of-apartments" =  60
    "number-of-floors" = 5
    "number-of-basements" = 1

    "average-doors-per-floor" = 60 / 5 = 12
    "elevator-per-column" = 12 / 6 = 2
    "elevator-columns" = 5 / 20 = 0.25 rounded to 1.
    "elevator-amount" = 2 * 1 = 2

Example of commercial
    "number-of-floors" = 21
    "number-of-basements" = 2
    "number-of-companies" = 5
    "number-of-parking-spots" = 100
    "number-of-elevators" = 1

    "elevator-amount" = 1

    "elevator-amount" is equal to "number-of-elevators"

Example of corporate or hybrid
    "number-of-floors" = 89
    "number-of-basements" = 6
    "number-of-parking-spots" = 101
    "number-of-corporations" = 15
    "maximum-occupancy" = 240

    "total-occupants" = 240 * (89 + 6) = 22800
    "elevator-required" = 22800 / 1000 = 22.8 or rounded to 23
    "elevator-columns" = (89 + 6) / 20 = 4.75 or rounded to 5
    "elevators-per-colum"23/5 = 4.6
    "elevator-amount" = 5 * 23 = 115

    Multiply the number of occupants per floor by the number of floors (including the number of basements) to obtain the total number of occupants. 
    The number of elevators required is determined by the number of occupants divided by 1000. 
    The number of stories (including the number of basements) is divided by 20 to obtain the number of elevator columns required. 
    Then divide the number of elevators by the number of columns to get the number of elevators per column. 
    The total number of elevators is determined by the number of elevators per column multiplied by the number of columns.

    number-of-floors" = 89
    "number-of-basements" = 6
    "number-of-parking-spots" = 101
    "number-of-corporations" = 15
    "maximum-occupancy" = 240

    "total-occupants" = 240 * (89 + 6) = 22800
    "elevators-required" = 22800 / 1000 = 22.8 or rounded to 23
    "elevator-columns" = (89 + 6) / 20 = 4.75 or rounded to 5
    "elevators-per-colum" = 23/5 = 4.6 rounded to 5.
    "elevator-total" = 5 * 5 = 25
    
   1 "total-occupants" = "maximum-occupancy" * ("number-of-floors" + "number-of-basements").
   2 "elevators-required" = "total-occupants" / 1000. Round up to int.
   3 "elevator-columns" = ("number-of-floors" + "number-of-basements") / 20. Rounded up to nearest int.
   4 "elevators-per-column" = "elevators-required" / "elevator-columns"
   5 "elevator-total" = "elevators-per-column" * "elevator-columns".


Budget Example commercial
    "elevator-amount" = 10
    "productLineID" = "premium"

    "elevator-total-price" = 10 * 12345 = 123450
    "final-price" = 123450 * 1.13 = 139498.50

    "elevator-total-price" = "elevator-amount" * "elevator-unit-price"
    
    "final-price" = "elevator-total-price" * "installation-fees"

    "elevator-unit-price" is 
        If productLineID = "standard" then "elevator-unit-price" = 7565
        If productLineID = "premium" then "elevator-unit-price" = 12345
        If productLineID = "excelium" then "elevator-unit-price" = 15400

    "installation-fees" is
        If productLineID = "standard" then "installation-fees" = 1.1
        If productLineID = "premium" then "installation-fees" = 1.13
        If productLineID = "excelium" then "installation-fees" = 1.16
*/



   