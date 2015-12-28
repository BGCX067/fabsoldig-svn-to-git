var DPTO_DEFAULT = '15';
var PROV_DEFAULT = '1501';

$(function() {
	$('.slider-input').jRange({
	    from: 1000,
	    to: 15000,
	    step: 100,
	    scale: ["S/.1,000","S/.7,500","+S/.15,000"],
	    width: '100%',
	    showLabels: false,
	    theme: 'theme-blue',
	    onstatechange: function(){
	    	$("#txtRentaMensual" ).val($("#inputSlider").val() + ".00");
	        $('.auto').autoNumeric('update');
	    	
	    }
	});
	
	$("#txtRentaMensual").val($("#inputSlider").val() + ".00");
    $('.auto').autoNumeric('init');
    $('.auto').autoNumeric('update');
    
    fxReloadCaptcha(); 
    
    //$("#txtNumeroDocumento").focus();
    
});


function fxReloadCaptcha() {
    var captchaKey = 'abc';
    document.getElementById("imgCaptcha").src = "jcaptcha?captchaKey=" + captchaKey + "&version=" + (new Date).getTime();
}    

function fxSolicitarTarjeta() {
	
	if(document.getElementById("imgContinuar").style.display == "none") {
		return false;
	}
	
	
	var frmLifeMiles = document.frmLifeMiles;
	
	var datosCliente = {
		tipoDocumento: frmLifeMiles.cmbTipoDocumento.value,
		numeroDocumento: frmLifeMiles.txtNumeroDocumento.value,
		nombres: frmLifeMiles.txtNombres.value,
		apellidoPaterno: frmLifeMiles.txtApellidoPaterno.value,
		apellidoMaterno: frmLifeMiles.txtApellidoMaterno.value,
		telefono: frmLifeMiles.txtTelefono.value,
		operador: frmLifeMiles.cmbOperador.value,
		celular: frmLifeMiles.txtCelular.value,
		correo: frmLifeMiles.txtCorreo.value,
		departamento: frmLifeMiles.cmbDepartamento.value,
		provincia: frmLifeMiles.cmbProvincia.value,
		rentaMensual: $("#inputSlider").val(),
		flagDatosPersonales: frmLifeMiles.chkAutTDP.value,
		flagTerminosCondiciones: frmLifeMiles.chkTyC.value,
		tipoCliente: ''
	};
	
	CampaingAction.validateCaptchaAjax(frmLifeMiles.txtCaptcha.value, function(data) {
		if("OK" == data) {
			CampaingAction.saveCampaingAjax(datosCliente, function(data) {
				frmLifeMiles.submit();
			});
			$("#formCaptcha").removeClass("has-error");
			$("#spanCaptcha").hide();
		} else {
			$("#formCaptcha").addClass("has-error");
			$("#spanCaptcha").show();
			$("#txtCaptcha").focus();
			fxReloadCaptcha();
		}
	});	        	
	return false;
	
}

function validarSiNumero(numero){
    if (!/^([0-9])*$/.test(numero))
      alert("El valor " + numero + " no es un número");
  }

function fxShowNombresApellidos(obj) {
	txt = obj.options[obj.selectedIndex].value;
		
	if ( txt.match("L") ) {
		document.getElementById("divNombresApellidos").style.display = 'none';
	} else {
		document.getElementById("divNombresApellidos").style.display = '';
	}
	
	document.getElementById("txtNumeroDocumento").value="";
	switch(document.getElementById("cmbTipoDocumento").value) {
	    case "L":         
	        document.getElementById("txtNumeroDocumento").setAttribute("maxlength", "8");
	        $("#txtNumeroDocumento").unbind();
	        $("#txtNumeroDocumento").numeric();
	    break;
	    case "P":
	        document.getElementById("txtNumeroDocumento").setAttribute("maxlength", "12");
	        $("#txtNumeroDocumento").unbind();
	        $("#txtNumeroDocumento").alphanum({
	            allowSpace: false
	        });
	    break;
	    case "E":
	        document.getElementById("txtNumeroDocumento").setAttribute("maxlength", "12");
	        $("#txtNumeroDocumento").unbind();
	        $("#txtNumeroDocumento").alphanum({
	            allowSpace: false
	        });
	    break;
	    case "D":
	        document.getElementById("txtNumeroDocumento").setAttribute("maxlength", "12");
	        $("#txtNumeroDocumento").unbind();
	        $("#txtNumeroDocumento").alphanum({
	            allowSpace: false
	        });
	    break;
	}
    document.getElementById("txtApellidoPaterno").value = "";
    document.getElementById("txtApellidoMaterno").value = "";
    document.getElementById("txtNombres").value = "";
    
}

function fxGetProvinciasByDpto(codDpto){
	//var codCanal = document.getElementById('cmbDepartamento').value;
	dwr.util.removeAllOptions("cmbProvincia");
	ParametroService.getProvinciasByDpto(codDpto, function(data){
		dwr.util.addOptions("cmbProvincia", data, "COD_PROV", "NOM_PROV");
		for(var z=0; z<data.length; z++){
			if(data[z].COD_PROV == PROV_DEFAULT){
				dwr.util.setValue("cmbProvincia", PROV_DEFAULT);
				break;
			}
		}		
	});	
}