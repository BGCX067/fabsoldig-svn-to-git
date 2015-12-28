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
       	content: '<div class="fancybox-header">T&Eacute;RMINOS Y CONDICIONES TARJETA LIFE MILES</div><br/><div class="fancybox-content"><p>&#8226; Para Tarjeta Nueva: Emisión de la Tarjeta de Crédito sujeta a evaluación crediticia y a la suscripción de los documentos requeridos por el Banco. Oferta aprobada sólo en caso se mantengan las condiciones crediticias que motivaron su pre-aprobación. La clasificación del cliente deberá ser 100% normal en BBVA Continental y en el sistema financiero. No aplica en caso de haber contratado un crédito con el BBVA Continental u otra entidad financiera en los últimos 45 días hábiles. Para acceder al bono de bienvenida el cliente debe cumplir con la meta de compras en terminales POS o por internet los primeros 30 días desde la emisión de la tarjeta. Meta: Oro=S/. 800, Platinum=S/. 1,500, Signature=S/. 4,500. Bono solo se entrega al cliente por única vez titular de la tarjeta emitida. No se realizará el abono de millas a las tarjetas que se encuentren bloqueadas por mora o sobregiro al momento de la devolución. Las tarjetas adicionales, migración de tarjetas y upgrade no aplican al bono.</p><p>&#8226; Para Migración a Tarjeta LifeMiles: Aplican clientes con tarjetas ACTIVAS, de marca VISA en nuevos soles ,con calificación normal en el sistema financiero, sin deuda vencida, sin bloqueo temporal o definitivo y debe cumplir con la línea mínima requerida para la nueva Tarjeta de Crédito: Visa Oro LifeMiles S/2,000, Visa Platinum LifeMiles S/.5,000 y Visa Signature LifeMiles S/.12,000. Es necesaria la aceptación de las nuevas condiciones de la Tarjeta LifeMiles indicadas en el nuevo HRI. Los clientes que deseen migrar a esta nueva tarjeta LifeMiles podrán migrar la totalidad de sus Puntos Vida acumulados con todas sus tarjetas de crédito y débito a millas LifeMiles y recibirán 1 milla por cada 1.5 Puntos Vida; además de una bonificación del 25% adicional de sus millas migradas. Esta promoción de bonificación de millas será válida hasta el 30/04/15 y solo al momento que el cliente acepte la migración de tarjeta. En caso el cliente desee mantener sus Puntos Vida, deberá tener una Tarjeta de Crédito distinta a la LifeMiles o una tarjeta de débito del banco para poder realizar canjes. La nueva Tarjeta de Crédito llegará a la dirección del contrato que esté registrada en la base de datos del banco.</p><p>&#8226; Para Venta Nueva y Migración: El cliente debe aceptar los términos y condiciones del Programa y la Política de Privacidad de LifeMiles ingresando a www.lifemiles.com, de lo contrario podría no tener la posibilidad de redimir sus millas y/o no recibir información del Programa LifeMiles. Los temas relacionados con el servicio de transporte de Avianca, así como la operatividad del programa LifeMiles, son de responsabilidad de Avianca. LifeMiles es una marca registrada de LifeMiles Corp . En caso de incumplimiento de pago se aplicarán, cobros de penalidad y demás pactados en su contrato y en caso corresponda se realizará el reporte a las centrales de Riesgo. Mayor información sobre la tarjeta, tasa de interés, comisiones, gastos y penalidades se encuentran publicados en el tarifario en oficinas de atención al público y en bbvacontinental.pe. ITF 0.005% sujeto a variación.</p></div>',
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
       	content: '<div class="fancybox-header">AUTORIZACI&Oacute;N DE RECOPILACIÓN Y TRATAMIENTO DE DATOS</div><br/><div class="fancybox-content">&#8226; La información que nos proporciona al solicitar un producto y/o servicio como su nombre, apellido, nacionalidad, estado civil, DNI, ocupación, domicilio, estado de salud, entre otros, así como la referida a los rasgos físicos y/o conducta que lo identifican o lo hacen identificable como es su huella dactilar, su voz, etc. (datos biométricos), conforme a la Ley es considerada como Datos Personales.<br />&#8226; Usted nos da su consentimiento libre, previo o expreso e informado para que sus Datos Personales sean tratados por el Banco conforme establecen las normas sobre Protección de Datos Personales. Esta autorización es indefinida.<br />&#8226; Sus Datos Personales serán almacenados (guardados) en el Bando de Datos de Clientes del cual el Banco es titular o en cualquier otro que en el futuro podamos establecer. Hemos adoptado las medidas necesarias para mantener segura su información.<br />&#8226; Con esta autorización el Banco podrá (i) evaluar si otorga el (los) producto(s) y/o servicio(s) que solicita, (ii) ofrecerle los productos y/o servicios del Banco y/o de terceros vinculados o no (por ejemplo cuentas, préstamos, entre otros), así como enviarle ofertas comerciales o publicidad sobre éstos, (iii)usar y/o transferir (dentro o fuera del país) a terceros vinculados o no al Banco.<br />&#8226; IMPORTANTE: Si no da su autorización, no podremos tratar sus Datos Personales, en la forma explicada en esta autorización.<br />&#8226; Asimismo, Usted puede revocar el consentimiento para tratar sus Datos Personales. Para ejercer este derecho o cualquier otro que la ley establece con relación a sus Datos Personales deberá presentar una solicitud escrita en nuestras oficinas. Se podrán establecer otros canales para tramitar estas solicitudes, lo que será informado oportunamente por el Banco a través de su página web<br /></div>',
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