<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean"  prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c" %>
<%@page import="botdetect.ImageStyle"%>
<%@page import="botdetect.ImageFormat"%>
<%@page import="botdetect.infrastructure.drawing.ImageSize"%>
<%@page import="botdetect.CodeStyle"%>
<%@page import="botdetect.web.Captcha"%>
<%@taglib prefix="botDetect" uri="botDetect"%>
 <!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>¡Bienvenido a la Experiencia Life Miles!</title>

    <!-- Bootstrap -->
    <link href="<%= request.getContextPath()%>ST/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath()%>ST/bootstrap/css/style.css" rel="stylesheet">
    
	<link rel="stylesheet" href="<%=request.getContextPath()%>ST/css/jquery.range.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-N9W8TX"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    '//www.googletagmanager.com/gtm.js?id='+i+dl+'&nc='+new Date().getTime();f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-N9W8TX');</script>
  
    <img id="rainbow" src="<%=request.getContextPath() %>ST/img/rainbow.png"/>

	<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
		<img id="logo" src="<%=request.getContextPath() %>ST/img/logoSmall3.png" class="img-responsive" alt="Responsive image"/>
		</div>
		<div class="col-sm-12"><h5>
		<span align="left" class="cabeceraBBVA">
		Tu tarjeta BBVA Continental LifeMiles a 1 Paso
		</span>
		</h5></div>
		<div class="col-sm-12">
		<span class="titulo1">Ingresa tus Datos Personales </span>
		</div>
	</div>
	<%--
	<form name="frmLifeMiles" action="<%=request.getContextPath() %>/campaing.do?method=validateCaptcha2"  method="POST">
	--%>
	<form name="frmLifeMiles" action="<%=request.getContextPath() %>/campaing.do?method=campaingInfo"  method="POST" onsubmit="return fxSolicitarTarjeta();">
	<div class="row">
		<div class="col-sm-7">
		<div class="row">
			<div class="form-group col-sm-6">
				<label for="cmbTipoDocumento">Documento Identidad<span class="obligatorio"> (*)</span></label>
				<select id="cmbTipoDocumento" name="cmbTipoDocumento" class="form-control" onchange="fxShowNombresApellidos(this);">
					<option value="L">DNI</option>
					<option value="P">Pasaporte</option>
					<option value="E">Carné de Extranjería</option>
					<option value="D">Carné de Diplomático</option>
				</select>
			</div>
			<div id="formNumeroDocumento" class="form-group col-sm-6">
				<label for="txtNumeroDocumento">&nbsp;</label>
				<input type="text" id="txtNumeroDocumento" name="txtNumeroDocumento" value="" 
				placeholder="Número documento" onchange="fxActivaContinuar();" onblur="return fxValidaDNI();" 
				maxlength="8" class="form-control"
				style="color: #7e7e7e;" autocomplete="off">
				<span id="spanNumeroDocumento" class="text-danger" hidden="hidden">Debes ingresar un número de documento válido</span>
			</div>
		</div>
			<div class="row" id="divNombresApellidos" style="display: none;">
			<div id="formNombres" class="form-group col-sm-6">
				<label for="txtNombres">Nombres<span class="obligatorio"> (*)</span></label>
				<input type="text" id="txtNombres" name="txtNombres" value="" placeholder="Nombres" onblur="fxMinimoNombres();" class="form-control" maxlength="50"
				 autocomplete="off"/>
				<span id="spanNombres" class="text-danger" hidden="hidden">Debes ingresar tus Nombres</span>
			</div>
			<div id="formApellidoPaterno" class="form-group col-sm-6">
				<label for="txtApellidoPaterno">Apellidos<span class="obligatorio"> (*)</span></label>
				<input type="text" id="txtApellidoPaterno" onchange="fxActivaContinuar();" name="txtApellidoPaterno" value="" placeholder="Apellidos" onblur="fxMinimoApellido();" class="form-control" maxlength="50"
				autocomplete="off"/>
				<span id="spanApellidoPaterno" class="text-danger" hidden="hidden">Debes ingresar tu Apellido Paterno</span>
			</div>
			</div>
			<div class="row">
			<div id="formTelefono" class="form-group col-sm-6">
				<label for="txtTelefono">Teléfono de Contacto<span class="obligatorio"> (*)</span></label>
				<label for="cmbOperador">&nbsp;</label>
				<select id="cmbOperador" name="cmbOperador" class="form-control" onchange="fxActivaContinuar();">
					<option value="F">Teléfono Fijo</option>
					<option value="M">Movistar</option>
					<option value="C">Claro</option>
					<option value="E">Entel</option>
					<option value="O">Otros</option>
				</select>
			</div>
			<div class="form-group col-sm-6">
				<label for="txtTelefono">&nbsp;</label>
				<input style="color: #7e7e7e;" type="text" id="txtTelefono" name="txtTelefono" value="" 
				placeholder="Número de Contacto" class="form-control" maxlength="9" onchange="fxActivaContinuar();" onblur="fxMinimoCelular();"
				autocomplete="off">
				<span id="spanCelular" class="text-danger" hidden="hidden">Debes ingresar un teléfono correcto</span>
			</div>
			
			</div>
			<div class="row">
			
			<div class="form-group col-sm-6">
				<label for="cmbDepartamento">Departamento<span class="obligatorio"> (*)</label>
				<select id="cmbDepartamento" name="cmbDepartamento" class="form-control" onchange="fxGetProvinciasByDpto(this.value);">
		      		</select>
			</div>
			<div class="form-group col-sm-6">
				<label for="cmbProvincia">Provincia<span class="obligatorio"> (*)</label>
				<select id="cmbProvincia" name="cmbProvincia" class="form-control">
		      	</select>
			</div>
			</div>
			
			<div class="row">
			<div id="formCorreo" class="form-group col-sm-6">
				<label for="txtCorreo">Correo Electrónico<span class="obligatorio"> (*)</span></label>
				<input style="color: #7e7e7e;" type="email" id="txtCorreo" name="txtCorreo" value="" 
				maxlength="50" size="20" placeholder="Correo Electrónico" onchange="fxActivaContinuar();" 
				class="form-control" onblur="fxMinimoEmail();" autocomplete="off">
				<span id="spanCorreo" class="text-danger" hidden="hidden">Debes ingresar un email correcto</span>
			</div>
			</div>
			
			
			<div class="row">
			<div class="col-sm-12">
			<span class="obligatorio">(*) Campo Obligatorio</span>
			</div>
			</div>
		</div>
		<div class="col-sm-5"><img  src="<%=request.getContextPath() %>ST/img/tarjeta_oro_lfm2.png" class="img-responsive" alt="Responsive image"></div>
		</div>
	<div class="row">
		<!-- div class="col-sm-3">
		< div class="checkbox">
	    	<label style="width: 100%;">
	        	<input type="checkbox" id="chkTyC" name="chkTyC" onclick="fxActivaContinuar();" value="S"> 
	        	<label id="lterms" style="color: #333333;">Acepto Términos y Condiciones</label>
	    	</label>
	    </div>
	    </div>
		<div class="col-sm-3"-->
		<div class="col-sm-6">
		<div class="checkbox">
	    	<label style="width: 100%;">
	        	<input type="checkbox" id="chkAutTDP" name="chkAutTDP" onclick="fxActivaContinuar();" value="S"> 
	        	<label id="laut" style="color: #333333;">Acepto Tratamiento de Datos Personales</label>
	    	</label>
	    </div>
		</div>
	</div>
	
	<div class="row">
		<div id="formCaptcha" class="col-sm-3">
			<label for="txtCaptcha" class="prompt">Ingresa el número de la Imagen</label>
			<input style="color: #7e7e7e;"  id="txtCaptcha" type="text" name="txtCaptcha" size="14" class="form-control" autocomplete="off" maxlength="4"/>
			<span id="spanCaptcha" class="text-danger" hidden="hidden">El número de la imagen es incorrecto</span>
		</div>
		<div class="col-sm-1">
			<label for="espacio1" class="prompt"></label>	
			<botDetect:captcha id="exampleCaptchaTag"  userInputClientId="txtCaptcha"  codeLength="4" codeStyle="numeric" imageStyles="graffiti, graffiti2" soundEnabled="false" helpLinkEnabled="false" helpLinkMode="false"/>
		</div>
		<div class="col-sm-7">
		</div>
	</div>
	<div class="row">
		<div id="espacio" class="col-sm-12">
		<label for="espacio2" class="prompt"></label>
		</div>
	</div>
	<div class="row">
		<div id="formLegal" class="form-group col-sm-12">
		<img id="logo" src="<%=request.getContextPath() %>ST/img/informacion.png" class="img-responsive" alt="Responsive image" align="left"></img>
		<span id="legal1" class="legal">&nbsp;&nbsp;El otorgamiento de la tarjeta está sujeto a evaluación por parte del banco.</span>
		</div>
	</div>
	<div class="row">
		<div id="espacio3" class="col-sm-12">
		<label for="espacio4" class="prompt"></label>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-5 col-sm-offset-3">
		<img id="imgContinuarDisabled" name="imgContinuarDisabled" src="<%=request.getContextPath() %>ST/img/enviar_disable.png" class="img-responsive" alt="Responsive image"/>
        <img id="imgContinuar" name="imgContinuar" src="<%=request.getContextPath() %>ST/img/enviar.png" onclick="document.frmLifeMiles.btnSolicitarTarjeta.click();" style="display: none;" class="img-responsive" alt="Responsive image"/>
		<input type="submit" name="btnSolicitarTarjeta"  value="Continuar" style="display: none;"/>
		</div>
	</div>
	<div class="row">
		<div id="espacio5" class="col-sm-12">
		<label for="espacio6" class="prompt"></label>
		</div>
	</div>
	</form>
	</div>

	<div class="modal fade" id="modalMostrarTerminos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
    	<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h5 class="modal-title" id="myModalLabel" 
				style="color: #004c93;font: 12px/1.6em 'Stag Sans Medium',Arial,sans-serif bold;">T&Eacute;RMINOS Y CONDICIONES TARJETA LIFE MILES</h4>
			</div>
			<div class="modal-body" 
			style="color: #67666a;font: 11px/1.3em 'Stag Sans Light',Arial,sans-serif;">
			<p>&#8226; Para Tarjeta Nueva: Emisión de la Tarjeta de Crédito sujeta a evaluación crediticia y a la suscripción de los documentos requeridos por el Banco. Oferta aprobada sólo en caso se mantengan las condiciones crediticias que motivaron su pre-aprobación. La clasificación del cliente deberá ser 100% normal en BBVA Continental y en el sistema financiero. No aplica en caso de haber contratado un crédito con el BBVA Continental u otra entidad financiera en los últimos 45 días hábiles. Para acceder al bono de bienvenida el cliente debe cumplir con la meta de compras en terminales POS o por internet los primeros 30 días desde la emisión de la tarjeta. Meta: Oro=S/. 800, Platinum=S/. 1,500, Signature=S/. 4,500. Bono solo se entrega al cliente por única vez titular de la tarjeta emitida. No se realizará el abono de millas a las tarjetas que se encuentren bloqueadas por mora o sobregiro al momento de la devolución. Las tarjetas adicionales, migración de tarjetas y upgrade no aplican al bono.</p><p>&#8226; Para Migración a Tarjeta LifeMiles: Aplican clientes con tarjetas ACTIVAS, de marca VISA en nuevos soles ,con calificación normal en el sistema financiero, sin deuda vencida, sin bloqueo temporal o definitivo y debe cumplir con la línea mínima requerida para la nueva Tarjeta de Crédito: Visa Oro LifeMiles S/2,000, Visa Platinum LifeMiles S/.5,000 y Visa Signature LifeMiles S/.12,000. Es necesaria la aceptación de las nuevas condiciones de la Tarjeta LifeMiles indicadas en el nuevo HRI. Los clientes que deseen migrar a esta nueva tarjeta LifeMiles podrán migrar la totalidad de sus Puntos Vida acumulados con todas sus tarjetas de crédito y débito a millas LifeMiles y recibirán 1 milla por cada 1.5 Puntos Vida; además de una bonificación del 25% adicional de sus millas migradas. Esta promoción de bonificación de millas será válida hasta el 30/04/15 y solo al momento que el cliente acepte la migración de tarjeta. En caso el cliente desee mantener sus Puntos Vida, deberá tener una Tarjeta de Crédito distinta a la LifeMiles o una tarjeta de débito del banco para poder realizar canjes. La nueva Tarjeta de Crédito llegará a la dirección del contrato que esté registrada en la base de datos del banco.</p><p>&#8226; Para Venta Nueva y Migración: El cliente debe aceptar los términos y condiciones del Programa y la Política de Privacidad de LifeMiles ingresando a www.lifemiles.com, de lo contrario podría no tener la posibilidad de redimir sus millas y/o no recibir información del Programa LifeMiles. Los temas relacionados con el servicio de transporte de Avianca, así como la operatividad del programa LifeMiles, son de responsabilidad de Avianca. LifeMiles es una marca registrada de LifeMiles Corp . En caso de incumplimiento de pago se aplicarán, cobros de penalidad y demás pactados en su contrato y en caso corresponda se realizará el reporte a las centrales de Riesgo. Mayor información sobre la tarjeta, tasa de interés, comisiones, gastos y penalidades se encuentran publicados en el tarifario en oficinas de atención al público y en bbvacontinental.pe. ITF 0.005% sujeto a variación.</p>
			</div>
    	</div>
  		</div>
	</div>

	<div class="modal fade" id="modalMostrarDatosPersonales" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
    	<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel"
				style="color: #004c93;font: 12px/1.6em 'Stag Sans Medium',Arial,sans-serif bold;">AUTORIZACI&Oacute;N DE RECOPILACIÓN Y TRATAMIENTO DE DATOS</h4>
			</div>
			<div class="modal-body"
			style="color: #67666a;font: 11px/1.3em 'Stag Sans Light',Arial,sans-serif;">
			&#8226; La información que nos proporciona al solicitar un producto y/o servicio como su nombre, apellido, nacionalidad, estado civil, DNI, ocupación, domicilio, estado de salud, entre otros, así como la referida a los rasgos físicos y/o conducta que lo identifican o lo hacen identificable como es su huella dactilar, su voz, etc. (datos biométricos), conforme a la Ley es considerada como Datos Personales.<br />&#8226; Usted nos da su consentimiento libre, previo o expreso e informado para que sus Datos Personales sean tratados por el Banco conforme establecen las normas sobre Protección de Datos Personales. Esta autorización es indefinida.<br />&#8226; Sus Datos Personales serán almacenados (guardados) en el Bando de Datos de Clientes del cual el Banco es titular o en cualquier otro que en el futuro podamos establecer. Hemos adoptado las medidas necesarias para mantener segura su información.<br />&#8226; Con esta autorización el Banco podrá (i) evaluar si otorga el (los) producto(s) y/o servicio(s) que solicita, (ii) ofrecerle los productos y/o servicios del Banco y/o de terceros vinculados o no (por ejemplo cuentas, préstamos, entre otros), así como enviarle ofertas comerciales o publicidad sobre éstos, (iii)usar y/o transferir (dentro o fuera del país) a terceros vinculados o no al Banco.<br />&#8226; IMPORTANTE: Si no da su autorización, no podremos tratar sus Datos Personales, en la forma explicada en esta autorización.<br />&#8226; Asimismo, Usted puede revocar el consentimiento para tratar sus Datos Personales. Para ejercer este derecho o cualquier otro que la ley establece con relación a sus Datos Personales deberá presentar una solicitud escrita en nuestras oficinas. Se podrán establecer otros canales para tramitar estas solicitudes, lo que será informado oportunamente por el Banco a través de su página web<br />
			</div>
    	</div>
  		</div>
	</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%= request.getContextPath()%>ST/bootstrap/js/jquery-1.11.2.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%= request.getContextPath()%>ST/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='<%= request.getContextPath()%>/dwr/interface/CampaingAction.js'></script>
	<script type="text/javascript" src='<%= request.getContextPath()%>/dwr/interface/ParametroService.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath()%>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath()%>/dwr/util.js'></script>
	
	<script type="text/javascript" src="https://rawgit.com/BobKnothe/autoNumeric/master/autoNumeric.js"></script>
		
	<script type='text/javascript' src="<%=request.getContextPath()%>ST/js/jquery.range.js"></script>
	<script type='text/javascript' src="<%=request.getContextPath()%>ST/js/header.js"></script>
	
	<script type='text/javascript' src="<%=request.getContextPath()%>ST/js/footer.js"></script>
	<script type='text/javascript' src="<%=request.getContextPath()%>ST/js/jquery.alphanum.js"></script>
   	<script>
   	
   	var dni		 = document.getElementById("txtNumeroDocumento");
	var nombre 	 = document.getElementById("txtNombres");
    var apePat	 = document.getElementById("txtApellidoPaterno");
    var correo	 = document.getElementById("txtCorreo");
    var captcha  = document.getElementById("txtCaptcha");
	var chkTyC   = document.getElementById("chkAutTDP");
	var tipo 	 = document.getElementById("cmbTipoDocumento");
	
	$(document).ready(function() {
		
	        /*$("#txtNumeroDocumento").numeric();
	        $("#txtTelefono").numeric();
	        $('#txtNombres').alpha({allow:" "});
	        $('#txtApellidoPaterno').alpha({allow:" "});
	        $('#txtApellidoMaterno').alpha({allow:" "});*/
	        $("#txtNumeroDocumento").numeric();
	        $("#cmbTipoDocumento").focus();
	        //$("#txtTelefono").numeric();
	        $("#txtTelefono").numeric();
	        $("#txtNombres").alpha();
	        $("#txtApellidoPaterno").alpha();
	        //$("#txtApellidoMaterno").alpha();
	        //$("#txtTelefono").numeric()
	        /*$("#txtTelefono").focus(function(){
	        	if($("#txtNumeroDocumento").val().length==0){
	        		$("#txtNumeroDocumento").focus();
	        	}
			});*/
	        $("#txtTelefono").focus(function(){
	        	if($("#txtNumeroDocumento").val().length==0){
	        		$("#txtNumeroDocumento").focus();
	        	}
			});
	        $("#txtCorreo").focus(function(){
	        	if($("#txtNumeroDocumento").val().length==0){
	        		$("#txtNumeroDocumento").focus();
	        	}
			});
	        $("#txtNombres").focus(function(){
	        	if($("#txtNumeroDocumento").val().length==0){
	        		$("#txtNumeroDocumento").focus();
	        	}
			});
	        $("#txtApellidoPaterno").focus(function(){
	        	if($("#txtNumeroDocumento").val().length==0){
	        		$("#txtNumeroDocumento").focus();
	        	}
			});
	       
		});
   	</script>
   	
   	<c:if test="${campaingForm ne null}">
   	<script type="text/javascript">
   		$("#cmbTipoDocumento").val('${campaingForm.cmbTipoDocumento}');
   		$("#txtNumeroDocumento").val('${campaingForm.txtNumeroDocumento}');
   		$("#cmbOperador").val('${campaingForm.cmbOperador}');
   		$("#txtTelefono").val('${campaingForm.txtTelefono}');
   		$("#txtCorreo").val('${campaingForm.txtCorreo}');
   		$("#txtNombres").val('${campaingForm.txtNombres}');
   		$("#txtApellidoPaterno").val('${campaingForm.txtApellidoPaterno}'); 
   		dwr.util.setValue("cmbDepartamento", '${campaingForm.cmbDepartamento}');
   		dwr.util.setValue("cmbProvincia", '${campaingForm.cmbProvincia}');
   		$("#chkAutTDP").prop('checked', true);
   		document.getElementById("imgContinuar").style.display = '';
   		document.getElementById("imgContinuarDisabled").style.display = 'none';
   		$("#formCaptcha").addClass("has-error");
		$("#spanCaptcha").show();
		$("#txtCaptcha").focus();
   	</script>
   	</c:if>
   	
   	
   	<script type='text/javascript'>
			
			function fxValidaDNI() {
				var tipoDocumento = $("#cmbTipoDocumento").val();
				if (tipoDocumento == "L"){
					if ($("#txtNumeroDocumento").val() != null && $("#txtNumeroDocumento").val() != "" 
							&& $("#txtNumeroDocumento").val().length==8) {
						var datosCliente = {
								tipoDocumento: frmLifeMiles.cmbTipoDocumento.value,
								numeroDocumento: frmLifeMiles.txtNumeroDocumento.value
						};
						CampaingAction.getOfferByCustomerAjax(datosCliente, function(data) {
							if(data==undefined || data==null) {
								CampaingAction.getPersonByIdAjax(datosCliente, function(data) {
									if(data==undefined || data==null) {
										document.getElementById("divNombresApellidos").style.display = '';
										fxValidaDatosGenerales(true);
										$("#txtNombres").val('');
								        $("#txtApellidoPaterno").val('');
								        $("#txtApellidoMaterno").val('');
										$("#txtNombres").focus();
									} else {
										document.getElementById("divNombresApellidos").style.display = 'none';
										fxValidaDatosGenerales(false);
										$("#txtTelefono").focus();
									}
								});
							};
						});
						$("#formNumeroDocumento").removeClass("has-error");
						$("#spanNumeroDocumento").hide();
					} else {
						document.getElementById("divNombresApellidos").style.display = 'none';
						fxValidaDatosGenerales(false);
						$("#txtTelefono").focus();
						$("#formNumeroDocumento").addClass("has-error");
						$("#spanNumeroDocumento").show();
						$("#txtNumeroDocumento").focus();
					}
				}else{
					if($("#txtNumeroDocumento").val().length>=7){
						$("#formNumeroDocumento").removeClass("has-error");
						$("#spanNumeroDocumento").hide();
						$("#txtNombres").focus();
					}else{
						$("#formNumeroDocumento").addClass("has-error");
						$("#spanNumeroDocumento").show();
						$("#txtNumeroDocumento").focus();
					}
				}
				
			}				
			   
			function fxMinimoNombres() {
				var tamano=$("#txtNombres").val().length;
				if($("#txtNumeroDocumento").val().length!=0){
					if(tamano==0){
						$("#formNombres").addClass("has-error");
						$("#spanNombres").show();
						$("#txtNombres").focus();
					}else{
						$("#formNombres").removeClass("has-error");
						$("#spanNombres").hide();
						$("#txtApellidoPaterno").focus();
					}
				}
		    }
			
			function fxMinimoApellido() {
				var tamano=$("#txtApellidoPaterno").val().length;
				if($("#txtNumeroDocumento").val().length!=0){
					if(tamano==0){
						$("#formApellidoPaterno").addClass("has-error");
						$("#spanApellidoPaterno").show();
						$("#txtApellidoPaterno").focus();
					}else{
						$("#formApellidoPaterno").removeClass("has-error");
						$("#spanApellidoPaterno").hide();
					}
				}
		    }
						
			function fxMinimoCelular() {
				var tamano=$("#txtTelefono").val().length;
				var tipOperador = $("#cmbOperador").val();
				if(tipOperador =="F"){
					if(tamano > 5 &&  tamano <= 9){
						$("#formCelular").removeClass("has-error");
						$("#spanCelular").hide();
					}else{
						$("#formCelular").addClass("has-error");
						$("#spanCelular").show();
						$("#txtTelefono").focus();
					}
				}else{ 
					if(tamano<9 && tamano>0){
						$("#formCelular").addClass("has-error");
						$("#spanCelular").show();
						$("#txtTelefono").focus();
					}else{
						$("#formCelular").removeClass("has-error");
						$("#spanCelular").hide();
					}
				}
			}
			
			function fxMinimoEmail() {
				var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if($("#txtNumeroDocumento").val().length!=0){
					if(!regex.test($("#txtCorreo").val())){
						$("#formCorreo").addClass("has-error");
						$("#spanCorreo").show();
						$("#txtCorreo").focus();
					}else{
						$("#formCorreo").removeClass("has-error");
						$("#spanCorreo").hide();
					}
				}
			}
		        
			function fxValidaSoloTexto(event) {
				//var keynum = window.event ? event.charCode : event.keyCode;
				var keynum = event.charCode ;
				if (typeof keynum == "undefined") {
					keynum = event.keyCode;
					if (keynum >= 48 && keynum <= 59){
						return false;
					};
				}else if (keynum >= 48 && keynum <= 59)	
					return false;
			};
			
			function validateCaptcha2() {
				var frmLifeMiles = document.frmLifeMiles;
				CampaingAction.validateCaptcha2(frmLifeMiles.txtCaptcha.value, function(data) {
					alert(data);
				});
			}
			
			document.getElementById("exampleCaptchaTag_CaptchaImage").parentNode.href = "#";
			document.getElementById("exampleCaptchaTag_CaptchaImage").parentNode.target = "_self";

		   
        </script>
  </body>
</html>
