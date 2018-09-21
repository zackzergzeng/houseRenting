/**
 * 对changehouseinfo.jsp页面进行操作
 */
function setLocation(chiprovince,chicity,chidistrict){
	var la=chiprovince+'/'+chicity+'/'+chidistrict;
	$('#location').attr("value",la);
}
function setHouseClassInChi(chihouseClass){
	if(chihouseClass==1){
		$('#entireRent').attr("checked", 'checked');
	}
	if(chihouseClass==2){
		$('#sharedRent').attr("checked", 'checked');
	}
}
function setFitmentInChi(chifitment){
	$('#fitment').val(chifitment)
}
function setHouseTypeInChi(chihouseType){
	$('#houseType').val(chihouseType)
}
function setOrientationInChi(chiorientation){
	$('#orientation').val(chiorientation)
}
function setLevelInChi(chilevel){
	$('#level').val(chilevel)
}
