var DPTO_DEFAULT = '15';
var PROV_DEFAULT = '1501';

$(function() {
	/*
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
	*/
	$("#txtRentaMensual").val($("#inputSlider").val() + ".00");
	/*
    $('.auto').autoNumeric('init');
    $('.auto').autoNumeric('update');
    */
    fxReloadCaptcha(); 
    
    //$("#txtNumeroDocumento").focus();
    
});


function fxReloadCaptcha() {
    //var captchaKey = '123';
    //document.getElementById("imgCaptcha").src = "jcaptcha?captchaKey=" + captchaKey + "&version=" + (new Date).getTime();
	/*<%
    // Adding BotDetect Captcha to the page
    Captcha captcha = Captcha.load(request, "filteredCaptcha");
    captcha.setCodeStyle(CodeStyle.NUMERIC);
    captcha.setCodeLength(4);
    captcha.setCaptchaSoundEnabled(false);
    
  	//Definir estilos para captcha
    captcha.setImageStyle(ImageStyle.AncientMosaic);
    captcha.setReloadIconTooltip("Refrescar");
    
    captcha.renderCaptchaMarkup(pageContext.getServletContext(), pageContext.getOut());
    //Definir tamaño del captcha 
    //ImageSize m = new ImageSize(100,40);
    //captcha.setImageSize(m);
    //captcha.setReloadEnabled(true);
    
    %>*/
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
		//apellidoMaterno: frmLifeMiles.txtApellidoMaterno.value,
		//telefono: frmLifeMiles.txtTelefono.value,
		operador: frmLifeMiles.cmbOperador.value,
		telefono: frmLifeMiles.txtTelefono.value,
		correo: frmLifeMiles.txtCorreo.value,
		departamento: frmLifeMiles.cmbDepartamento.value,
		provincia: frmLifeMiles.cmbProvincia.value,
		//rentaMensual: $("#inputSlsider").val(),
		flagDatosPersonales: frmLifeMiles.chkAutTDP.value,
		//flagTerminosCondiciones: frmLifeMiles.chkTyC.value,
		tipoCliente: ''
	};	
	frmLifeMiles.submit();
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
    //document.getElementById("txtApellidoMaterno").value = "";
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