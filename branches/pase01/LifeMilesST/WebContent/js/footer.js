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
			fxMostrarDatosPersonales();
		}
	});
	
	$('#laut').bind('click', function(){
		$('#chkAutTDP').prop('checked', true);
		fxMostrarDatosPersonales();
		fxActivaContinuar();
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
	/*$.fancybox({
		afterShow : function() {
			$('.fancybox-accept').bind('click', function(){
				$.fancybox.close();
			});
		},
		autoSize : false,
		beforeLoad : function() {
       	},
       	closeBtn: true,
       	closeClick: false,
       	content: '<div class="fancybox-header">T&Eacute;RMINOS Y CONDICIONES TARJETA LIFE MILES</div><br/><div class="fancybox-content"><p>&#8226; Para Tarjeta Nueva: Emisi�n de la Tarjeta de Cr�dito sujeta a evaluaci�n crediticia y a la suscripci�n de los documentos requeridos por el Banco. Oferta aprobada s�lo en caso se mantengan las condiciones crediticias que motivaron su pre-aprobaci�n. La clasificaci�n del cliente deber� ser 100% normal en BBVA Continental y en el sistema financiero. No aplica en caso de haber contratado un cr�dito con el BBVA Continental u otra entidad financiera en los �ltimos 45 d�as h�biles. Para acceder al bono de bienvenida el cliente debe cumplir con la meta de compras en terminales POS o por internet los primeros 30 d�as desde la emisi�n de la tarjeta. Meta: Oro=S/. 800, Platinum=S/. 1,500, Signature=S/. 4,500. Bono solo se entrega al cliente por �nica vez titular de la tarjeta emitida. No se realizar� el abono de millas a las tarjetas que se encuentren bloqueadas por mora o sobregiro al momento de la devoluci�n. Las tarjetas adicionales, migraci�n de tarjetas y upgrade no aplican al bono.</p><p>&#8226; Para Migraci�n a Tarjeta LifeMiles: Aplican clientes con tarjetas ACTIVAS, de marca VISA en nuevos soles ,con calificaci�n normal en el sistema financiero, sin deuda vencida, sin bloqueo temporal o definitivo y debe cumplir con la l�nea m�nima requerida para la nueva Tarjeta de Cr�dito: Visa Oro LifeMiles S/2,000, Visa Platinum LifeMiles S/.5,000 y Visa Signature LifeMiles S/.12,000. Es necesaria la aceptaci�n de las nuevas condiciones de la Tarjeta LifeMiles indicadas en el nuevo HRI. Los clientes que deseen migrar a esta nueva tarjeta LifeMiles podr�n migrar la totalidad de sus Puntos Vida acumulados con todas sus tarjetas de cr�dito y d�bito a millas LifeMiles y recibir�n 1 milla por cada 1.5 Puntos Vida; adem�s de una bonificaci�n del 25% adicional de sus millas migradas. Esta promoci�n de bonificaci�n de millas ser� v�lida hasta el 30/04/15 y solo al momento que el cliente acepte la migraci�n de tarjeta. En caso el cliente desee mantener sus Puntos Vida, deber� tener una Tarjeta de Cr�dito distinta a la LifeMiles o una tarjeta de d�bito del banco para poder realizar canjes. La nueva Tarjeta de Cr�dito llegar� a la direcci�n del contrato que est� registrada en la base de datos del banco.</p><p>&#8226; Para Venta Nueva y Migraci�n: El cliente debe aceptar los t�rminos y condiciones del Programa y la Pol�tica de Privacidad de LifeMiles ingresando a www.lifemiles.com, de lo contrario podr�a no tener la posibilidad de redimir sus millas y/o no recibir informaci�n del Programa LifeMiles. Los temas relacionados con el servicio de transporte de Avianca, as� como la operatividad del programa LifeMiles, son de responsabilidad de Avianca. LifeMiles es una marca registrada de LifeMiles Corp . En caso de incumplimiento de pago se aplicar�n, cobros de penalidad y dem�s pactados en su contrato y en caso corresponda se realizar� el reporte a las centrales de Riesgo. Mayor informaci�n sobre la tarjeta, tasa de inter�s, comisiones, gastos y penalidades se encuentran publicados en el tarifario en oficinas de atenci�n al p�blico y en bbvacontinental.pe. ITF 0.005% sujeto a variaci�n.</p></div>',
		fitToView	: false,
		height: 220,
		helpers:  {
	        overlay : {
	        	closeClick : true,
	            showEarly : false
	        }
		},
		margin: 0,
		padding: 30,
		title: false,
		wrapCSS: 'fancybox-devoluciones',
		width: 400
	});*/
	$('#modalMostrarTerminos').modal('show');
	$("#modalMostrarTerminos").css("z-index", "1500");
	//alert("fxMostrarTerminos");
}

function fxMostrarDatosPersonales() {
	/*$.fancybox({
		afterShow : function() {
			$('.fancybox-accept').bind('click', function(){
				$.fancybox.close();
			});
		},
		autoSize : false,
		beforeLoad : function() {
       	},
       	closeBtn: true,
       	closeClick: false,
       	content: '<div class="fancybox-header">AUTORIZACI&Oacute;N DE RECOPILACI�N Y TRATAMIENTO DE DATOS</div><br/><div class="fancybox-content">&#8226; La informaci�n que nos proporciona al solicitar un producto y/o servicio como su nombre, apellido, nacionalidad, estado civil, DNI, ocupaci�n, domicilio, estado de salud, entre otros, as� como la referida a los rasgos f�sicos y/o conducta que lo identifican o lo hacen identificable como es su huella dactilar, su voz, etc. (datos biom�tricos), conforme a la Ley es considerada como Datos Personales.<br />&#8226; Usted nos da su consentimiento libre, previo o expreso e informado para que sus Datos Personales sean tratados por el Banco conforme establecen las normas sobre Protecci�n de Datos Personales. Esta autorizaci�n es indefinida.<br />&#8226; Sus Datos Personales ser�n almacenados (guardados) en el Bando de Datos de Clientes del cual el Banco es titular o en cualquier otro que en el futuro podamos establecer. Hemos adoptado las medidas necesarias para mantener segura su informaci�n.<br />&#8226; Con esta autorizaci�n el Banco podr� (i) evaluar si otorga el (los) producto(s) y/o servicio(s) que solicita, (ii) ofrecerle los productos y/o servicios del Banco y/o de terceros vinculados o no (por ejemplo cuentas, pr�stamos, entre otros), as� como enviarle ofertas comerciales o publicidad sobre �stos, (iii)usar y/o transferir (dentro o fuera del pa�s) a terceros vinculados o no al Banco.<br />&#8226; IMPORTANTE: Si no da su autorizaci�n, no podremos tratar sus Datos Personales, en la forma explicada en esta autorizaci�n.<br />&#8226; Asimismo, Usted puede revocar el consentimiento para tratar sus Datos Personales. Para ejercer este derecho o cualquier otro que la ley establece con relaci�n a sus Datos Personales deber� presentar una solicitud escrita en nuestras oficinas. Se podr�n establecer otros canales para tramitar estas solicitudes, lo que ser� informado oportunamente por el Banco a trav�s de su p�gina web<br /></div>',
		fitToView	: false,
		height: 420,
		helpers:  {
	        overlay : {
	        	closeClick : true,
	            showEarly : false
	        }
		},
		margin: 0,
		padding: 30,
		title: false,
		wrapCSS: 'fancybox-devoluciones',
		width: 400
	});*/
	//alert("fxMostrarDatosPersonales");
	$('#modalMostrarDatosPersonales').modal('show');
	$("#modalMostrarDatosPersonales").css("z-index", "1500");
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
	if($('#chkTyC').prop('checked') && $('#chkAutTDP').prop('checked') 
			&& $('#txtNumeroDocumento').val()!="" && 
			((tipoDocumento == "L" && $('#txtNumeroDocumento').val().length==8) || tipoDocumento != "L") &&
			nombres &&
			($('#txtCorreo').val()!="" && regex.test($("#txtCorreo").val()))
				&& (($('#txtTelefono').val()!="" && $("#txtTelefono").val().length>=6 && $('#txtCelular').val()=="")
				|| ($('#txtCelular').val()!="" && $("#txtCelular").val().length>=9 && $('#txtTelefono').val()=="")
				|| ($('#txtCelular').val()!="" && $("#txtCelular").val().length>=9 && $('#txtTelefono').val()!="" && $("#txtTelefono").val().length>=6))) {
		document.getElementById("imgContinuarDisabled").style.display = "none";
		document.getElementById("imgContinuar").style.display = "";
	} else {
		document.getElementById("imgContinuarDisabled").style.display = "";
		document.getElementById("imgContinuar").style.display = "none";
	}
}

function fxValidaDatosGenerales(flag) {
	$('#txtApellidoPaterno').prop('required', flag);
	//$('#txtApellidoMaterno').prop('required', flag);
	$('#txtNombres').prop('required', flag);
}