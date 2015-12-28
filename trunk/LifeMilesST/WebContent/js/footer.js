$(function(){
	
	$('#chkTyC').bind('click', function(){
		if($('#chkTyC').prop('checked')) {
			fxMostrarTerminos();
		}
	});
	
	$('#lterms').bind('click', function(){
		$('#chkTyC').prop('checked', true);
		fxMostrarTerminos();
		fxActivaContinuar();
	});

	
	$('#chkAutTDP').bind('click', function(){
		if($('#chkAutTDP').prop('checked')) {
		//	fxMostrarDatosPersonales();
			var tamDNI=$("#txtNumeroDocumento").val().length;
			var tamTelefono=$("#txtTelefono").val().length;
			var tamCorreo=$("#txtNumeroDocumento").val().length;
			
			if(tamDNI==0){
				$("#formNumeroDocumento").addClass("has-error");
				$("#spanNumeroDocumento").show();
			}
			if(tamTelefono==0){
				$("#formCelular").addClass("has-error");
				$("#spanCelular").show();
			}
			if(tamCorreo==0){
				$("#formCorreo").addClass("has-error");
				$("#spanCorreo").show();
			}
			
		}
	});
	
	$('#laut').bind('click', function(){
		//$('#chkAutTDP').prop('checked', true);
		fxMostrarDatosPersonales();
		//fxActivaContinuar();
	});
	
	ParametroService.getAllDepartamentos(function(data) {
		dwr.util.removeAllOptions("cmbDepartamento");
		dwr.util.addOptions("cmbDepartamento", data, "COD_DPTO", "NOM_DPTO");				
		for(var z=0; z<data.length; z++){
			if(data[z].COD_DPTO == DPTO_DEFAULT){
				dwr.util.setValue("cmbDepartamento", DPTO_DEFAULT );
				fxGetProvinciasByDpto(DPTO_DEFAULT);
				break;
			}
		}
		
    });
	

});

function fxMostrarTerminos() {
	$('#modalMostrarTerminos').modal({keyboard: false,backdrop: 'static'});
	$('#modalMostrarTerminos').modal('show');
	$("#modalMostrarTerminos").css("z-index", "1500");
	//alert("fxMostrarTerminos");
}

function fxMostrarDatosPersonales() {
	$('#modalMostrarDatosPersonales').modal({keyboard: false,backdrop: 'static'});
	$('#modalMostrarDatosPersonales').modal('show');
	$("#modalMostrarDatosPersonales").css("z-index", "3000");
}

function fxAlertFancyBox(htmlText){
	$.fancybox({
		afterShow : function() {
			$('.fancybox-accept').bind('click', function(){
				$.fancybox.close();
			});
		},
		autoSize : true,
		beforeLoad : function() {
       	},
       	closeBtn: true,
       	closeClick: false,
		content: htmlText,
		fitToView	: true,
		height: 20,
		helpers:  {
	        overlay : {
	        	closeClick : true,
	            showEarly : false
	        }
		},
		margin: 0,
		padding: 20,
		title: true,
		wrapCSS: 'fancybox-devoluciones',
		width: 300
	});
}

function fxActivaContinuar() {
	var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var tipoDocumento = $("#cmbTipoDocumento").val();
	var nombres=true;
		if($("#divNombresApellidos").is(":visible")){
			if($('#txtNombres').val()=="" || $('#txtApellidoPaterno').val()==""){
				nombres=false;
			}
		}
		//Final
		if(	$('#txtNumeroDocumento').val()!="" && //$('#chkAutTDP').prop('checked') &&  
			((tipoDocumento == "L" && $('#txtNumeroDocumento').val().length==8) || tipoDocumento != "L") &&
			nombres&&
			($('#txtCorreo').val()!="")&&
			($('#txtTelefono').val()!="")&&
			(($("#cmbOperador").val()=="F" && $("#txtTelefono").val().length>=6) ||  ($("#cmbOperador").val()=="C" && $("#txtTelefono").val().length == 9))
			)
		{
			document.getElementById("imgContinuarDisabled").style.display = "none";
			document.getElementById("imgContinuar").style.display = "";
		} else {
			document.getElementById("imgContinuarDisabled").style.display = "";
			document.getElementById("imgContinuar").style.display = "none";
		}
		
		//Anterior
	 /*
	if($('#chkTyC').prop('checked') && $('#chkAutTDP').prop('checked')		  
			&& $('#txtNumeroDocumento').val()!="" && 
			((tipoDocumento == "L" && $('#txtNumeroDocumento').val().length==8) || tipoDocumento != "L") &&
			nombres &&
			($('#txtCorreo').val()!="" && regex.test($("#txtCorreo").val()))
				&& (($('#txtTelefono').val()!="" && $("#txtTelefono").val().length>=6 && $('#txtTelefono').val()=="")
				|| ($('#txtCelular').val()!="" && $("#txtCelular").val().length>=9 && $('#txtTelefono').val()=="")
				|| ($('#txtCelular').val()!="" && $("#txtCelular").val().length>=9 && $('#txtTelefono').val()!="" && $("#txtTelefono").val().length>=6))) {
		document.getElementById("imgContinuarDisabled").style.display = "none";
		document.getElementById("imgContinuar").style.display = "";
	} else {
		document.getElementById("imgContinuarDisabled").style.display = "";
		document.getElementById("imgContinuar").style.display = "none";
	}
		*/	  

}

function fxValidaDatosGenerales(flag) {
	$('#txtApellidoPaterno').prop('required', flag);
	//$('#txtApellidoMaterno').prop('required', flag);
	$('#txtNombres').prop('required', flag);
}