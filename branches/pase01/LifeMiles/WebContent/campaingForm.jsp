<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean"  prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c" %>
 <!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>�Bienvenido a la Experiencia Life Miles!</title>

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
		Solicitud de Tarjeta BBVA Continental LifeMiles
		</span>
		</h5></div>
		<div class="col-sm-12">
		<img src="<%=request.getContextPath() %>ST/img/line_time01.png" class="img-responsive" alt="Responsive image">
		</div>
		<div class="col-sm-12">
		<span class="titulo1">Ingresa tus Datos Personales </span>
		</div>
	</div>
	<form name="frmLifeMiles" action="<%=request.getContextPath() %>/campaing.do?method=campaingInfo"  method="POST" onsubmit="return fxSolicitarTarjeta();">
	<div class="row">
		<div class="col-sm-9">
		<div class="row">
			<div class="form-group col-sm-4">
				<label for="cmbTipoDocumento">Documento Identidad<span class="obligatorio"> (*)</span></label>
				<select id="cmbTipoDocumento" name="cmbTipoDocumento" class="form-control" onchange="fxShowNombresApellidos(this);">
					<option value="L">DNI</option>
					<option value="P">Pasaporte</option>
					<option value="E">Carn� de Extranjer�a</option>
					<option value="D">Carn� de Diplom�tico</option>
				</select>
			</div>
			<div id="formNumeroDocumento" class="form-group col-sm-4">
				<label for="txtNumeroDocumento">&nbsp;</label>
				<input type="text" id="txtNumeroDocumento" name="txtNumeroDocumento" value="" 
				placeholder="N�mero documento" onchange="fxActivaContinuar();" onblur="return fxValidaDNI();" 
				maxlength="8" class="form-control"
				style="color: #7e7e7e;" autocomplete="off">
				<span id="spanNumeroDocumento" class="text-danger" hidden="hidden">Debes ingresar un n�mero de documento v�lido</span>
			</div>
			</div>
			<div class="row" id="divNombresApellidos" style="display: none;">
			<div id="formNombres" class="form-group col-sm-4">
				<label for="txtNombres">Nombres<span class="obligatorio"> (*)</span></label>
				<input type="text" id="txtNombres" name="txtNombres" value="" placeholder="Nombres" onblur="fxMinimoNombres();" class="form-control" maxlength="50"
				 autocomplete="off"/>
				<span id="spanNombres" class="text-danger" hidden="hidden">Debes ingresar tus Nombres</span>
			</div>
			<div id="formApellidoPaterno" class="form-group col-sm-4">
				<label for="txtApellidoPaterno">Apellido Paterno<span class="obligatorio"> (*)</span></label>
				<input type="text" id="txtApellidoPaterno" onchange="fxActivaContinuar();" name="txtApellidoPaterno" value="" placeholder="Apellido Paterno" onblur="fxMinimoApellido();" class="form-control" maxlength="50"
				autocomplete="off"/>
				<span id="spanApellidoPaterno" class="text-danger" hidden="hidden">Debes ingresar tu Apellido Paterno</span>
			</div>
			<div class="form-group col-sm-4">
				<label for="txtApellidoMaterno">Apellido Materno</label>
				<input type="text" id="txtApellidoMaterno" onchange="fxActivaContinuar();" name="txtApellidoMaterno" value="" placeholder="Apellido Materno" class="form-control" maxlength="50"
				autocomplete="off"/>
			</div>
			</div>
			<div class="row">
			<div id="formTelefono" class="form-group col-sm-4">
				<label for="txtTelefono">Tel�fonos Contacto<span class="obligatorio"> (*)</span></label>
				<input style="color: #7e7e7e;" type="text" id="txtTelefono" name="txtTelefono" 
				value="" placeholder="T�lefono Fijo" onchange="fxActivaContinuar();" onblur="fxMinimoTelefono();" class="form-control" maxlength="9">
				<span id="spanTelefono" class="text-danger" hidden="hidden">El tel�fono debe ser mayor o igual a 6 d�gitos</span>
			</div>
			<div class="form-group col-sm-4">
				<label for="cmbOperador">&nbsp;</label>
				<select id="cmbOperador" name="cmbOperador" class="form-control">
					<option value="M">Movistar</option>
					<option value="C">Claro</option>
					<option value="E">Entel</option>
					<option value="O">Otros</option>
				</select>
			</div>
			<div id="formCelular" class="form-group col-sm-4">
				<label for="txtCelular">&nbsp;</label>
				<input style="color: #7e7e7e; type="text" id="txtCelular" name="txtCelular" value="" 
				placeholder="T�lefono Celular" class="form-control" maxlength="9" onchange="fxActivaContinuar();" onblur="fxMinimoCelular();"
				autocomplete="off">
				<span id="spanCelular" class="text-danger" hidden="hidden">El celular debe contar con 9 d�gitos</span>
			</div>
			</div>
			<div class="row">
			<div id="formCorreo" class="form-group col-sm-4">
				<label for="txtCorreo">Correo Electr�nico<span class="obligatorio"> (*)</span></label>
				<input style="color: #7e7e7e;" type="email" id="txtCorreo" name="txtCorreo" value="" 
				maxlength="50" size="20" placeholder="Correo Electr�nico" onchange="fxActivaContinuar();" 
				class="form-control" onblur="fxMinimoEmail();" autocomplete="off">
				<span id="spanCorreo" class="text-danger" hidden="hidden">Debes ingresar un email correcto</span>
			</div>
			<div class="form-group col-sm-4">
				<label for="cmbDepartamento">Departamento<span class="obligatorio"> (*)</label>
				<select id="cmbDepartamento" name="cmbDepartamento" class="form-control" onchange="fxGetProvinciasByDpto(this.value);">
		      		</select>
			</div>
			<div class="form-group col-sm-4">
				<label for="cmbProvincia">Provincia<span class="obligatorio"> (*)</label>
				<select id="cmbProvincia" name="cmbProvincia" class="form-control">
		      	</select>
			</div>
			</div>
			<div class="row">
			<div class="form-group col-sm-12">
				<label>Renta Mensual Bruta S/.</label>
				<div class="row">
				<div class="col-sm-8" style="height: 50px;padding-left: 30px;padding-top: 10px;"><a charset="UTF-8" ><input type="hidden" style="color: #7e7e7e;" class="slider-input" id="inputSlider" value="1000" /></a>
				</div>
				<div class="col-sm-4">
				<input type="text" id="txtRentaMensual" name="txtRentaMensual" class="auto form-control"  data-a-sign="S/. " size="11" readonly="readonly" style="color: #7e7e7e;"/>
				</div>
				</div>
			</div>
			<div class="col-sm-12">
			<span class="obligatorio">(*) Campo Obligatorio</span>
			</div>
			</div>
		</div>
		<div class="col-sm-3"><img  src="<%=request.getContextPath() %>ST/img/tarjeta_oro_lfm2.png" class="img-responsive" alt="Responsive image"></div>
	</div>
	<div class="row">
		<div class="col-sm-6">
		<div class="checkbox">
	    	<label style="width: 100%;">
	        	<input type="checkbox" id="chkTyC" name="chkTyC" onclick="fxActivaContinuar();" value="S"> 
	        	<label id="lterms" style="color: #333333;">Acepto T�rminos y Condiciones</label>
	    	</label>
	    </div>
	    </div>
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
		<div id="formCaptcha" class="form-group col-sm-3">
			<label for="txtCaptcha">C�digo de Imagen</label>
			<input style="color: #7e7e7e;" id="txtCaptcha" name="txtCaptcha" size="14" type="text" value="" class="form-control"
			autocomplete="off"/>
			<span id="spanCaptcha" class="text-danger" hidden="hidden">El c�digo de la imagen es incorrecto</span>
		</div>
		<div class="col-sm-5">
		<img id="imgCaptcha" src="jcaptcha" />
		<a href="javascript:fxReloadCaptcha();">
		<img src="<%=request.getContextPath() %>ST/img/actualizar1.png"/>
		</a>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-5 col-sm-offset-3">
		<img id="imgContinuarDisabled" name="imgContinuar" src="<%=request.getContextPath() %>ST/img/continuar_disable.png" width="40%" />
        <img id="imgContinuar" name="imgContinuar" src="<%=request.getContextPath() %>ST/img/continuar_vf.png" onclick="document.frmLifeMiles.btnSolicitarTarjeta.click();" width="40%" style="display: none;"/>
		<input type="submit" name="btnSolicitarTarjeta"  value="Continuar" style="display: none;"/>
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
			<p>&#8226; Para Tarjeta Nueva: Emisi�n de la Tarjeta de Cr�dito sujeta a evaluaci�n crediticia y a la suscripci�n de los documentos requeridos por el Banco. Oferta aprobada s�lo en caso se mantengan las condiciones crediticias que motivaron su pre-aprobaci�n. La clasificaci�n del cliente deber� ser 100% normal en BBVA Continental y en el sistema financiero. No aplica en caso de haber contratado un cr�dito con el BBVA Continental u otra entidad financiera en los �ltimos 45 d�as h�biles. Para acceder al bono de bienvenida el cliente debe cumplir con la meta de compras en terminales POS o por internet los primeros 30 d�as desde la emisi�n de la tarjeta. Meta: Oro=S/. 800, Platinum=S/. 1,500, Signature=S/. 4,500. Bono solo se entrega al cliente por �nica vez titular de la tarjeta emitida. No se realizar� el abono de millas a las tarjetas que se encuentren bloqueadas por mora o sobregiro al momento de la devoluci�n. Las tarjetas adicionales, migraci�n de tarjetas y upgrade no aplican al bono.</p><p>&#8226; Para Migraci�n a Tarjeta LifeMiles: Aplican clientes con tarjetas ACTIVAS, de marca VISA en nuevos soles ,con calificaci�n normal en el sistema financiero, sin deuda vencida, sin bloqueo temporal o definitivo y debe cumplir con la l�nea m�nima requerida para la nueva Tarjeta de Cr�dito: Visa Oro LifeMiles S/2,000, Visa Platinum LifeMiles S/.5,000 y Visa Signature LifeMiles S/.12,000. Es necesaria la aceptaci�n de las nuevas condiciones de la Tarjeta LifeMiles indicadas en el nuevo HRI. Los clientes que deseen migrar a esta nueva tarjeta LifeMiles podr�n migrar la totalidad de sus Puntos Vida acumulados con todas sus tarjetas de cr�dito y d�bito a millas LifeMiles y recibir�n 1 milla por cada 1.5 Puntos Vida; adem�s de una bonificaci�n del 25% adicional de sus millas migradas. Esta promoci�n de bonificaci�n de millas ser� v�lida hasta el 30/04/15 y solo al momento que el cliente acepte la migraci�n de tarjeta. En caso el cliente desee mantener sus Puntos Vida, deber� tener una Tarjeta de Cr�dito distinta a la LifeMiles o una tarjeta de d�bito del banco para poder realizar canjes. La nueva Tarjeta de Cr�dito llegar� a la direcci�n del contrato que est� registrada en la base de datos del banco.</p><p>&#8226; Para Venta Nueva y Migraci�n: El cliente debe aceptar los t�rminos y condiciones del Programa y la Pol�tica de Privacidad de LifeMiles ingresando a www.lifemiles.com, de lo contrario podr�a no tener la posibilidad de redimir sus millas y/o no recibir informaci�n del Programa LifeMiles. Los temas relacionados con el servicio de transporte de Avianca, as� como la operatividad del programa LifeMiles, son de responsabilidad de Avianca. LifeMiles es una marca registrada de LifeMiles Corp . En caso de incumplimiento de pago se aplicar�n, cobros de penalidad y dem�s pactados en su contrato y en caso corresponda se realizar� el reporte a las centrales de Riesgo. Mayor informaci�n sobre la tarjeta, tasa de inter�s, comisiones, gastos y penalidades se encuentran publicados en el tarifario en oficinas de atenci�n al p�blico y en bbvacontinental.pe. ITF 0.005% sujeto a variaci�n.</p>
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
				style="color: #004c93;font: 12px/1.6em 'Stag Sans Medium',Arial,sans-serif bold;">AUTORIZACI&Oacute;N DE RECOPILACI�N Y TRATAMIENTO DE DATOS</h4>
			</div>
			<div class="modal-body"
			style="color: #67666a;font: 11px/1.3em 'Stag Sans Light',Arial,sans-serif;">
			&#8226; La informaci�n que nos proporciona al solicitar un producto y/o servicio como su nombre, apellido, nacionalidad, estado civil, DNI, ocupaci�n, domicilio, estado de salud, entre otros, as� como la referida a los rasgos f�sicos y/o conducta que lo identifican o lo hacen identificable como es su huella dactilar, su voz, etc. (datos biom�tricos), conforme a la Ley es considerada como Datos Personales.<br />&#8226; Usted nos da su consentimiento libre, previo o expreso e informado para que sus Datos Personales sean tratados por el Banco conforme establecen las normas sobre Protecci�n de Datos Personales. Esta autorizaci�n es indefinida.<br />&#8226; Sus Datos Personales ser�n almacenados (guardados) en el Bando de Datos de Clientes del cual el Banco es titular o en cualquier otro que en el futuro podamos establecer. Hemos adoptado las medidas necesarias para mantener segura su informaci�n.<br />&#8226; Con esta autorizaci�n el Banco podr� (i) evaluar si otorga el (los) producto(s) y/o servicio(s) que solicita, (ii) ofrecerle los productos y/o servicios del Banco y/o de terceros vinculados o no (por ejemplo cuentas, pr�stamos, entre otros), as� como enviarle ofertas comerciales o publicidad sobre �stos, (iii)usar y/o transferir (dentro o fuera del pa�s) a terceros vinculados o no al Banco.<br />&#8226; IMPORTANTE: Si no da su autorizaci�n, no podremos tratar sus Datos Personales, en la forma explicada en esta autorizaci�n.<br />&#8226; Asimismo, Usted puede revocar el consentimiento para tratar sus Datos Personales. Para ejercer este derecho o cualquier otro que la ley establece con relaci�n a sus Datos Personales deber� presentar una solicitud escrita en nuestras oficinas. Se podr�n establecer otros canales para tramitar estas solicitudes, lo que ser� informado oportunamente por el Banco a trav�s de su p�gina web<br />
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
    var apeMat	 = document.getElementById("txtApellidoMaterno");
    var telefono = document.getElementById("txtTelefono");
    var correo	 = document.getElementById("txtCorreo");
    var captcha  = document.getElementById("txtCaptcha");
	var chkTyC   = document.getElementById("chkTyC");
	var tipo 	 = document.getElementById("cmbTipoDocumento");
	
	$(document).ready(function() {
		
	        /*$("#txtNumeroDocumento").numeric();
	        $("#txtTelefono").numeric();
	        $("#txtCelular").numeric();
	        $('#txtNombres').alpha({allow:" "});
	        $('#txtApellidoPaterno').alpha({allow:" "});
	        $('#txtApellidoMaterno').alpha({allow:" "});*/
	        $("#txtNumeroDocumento").numeric();
	        $("#cmbTipoDocumento").focus();
	        $("#txtTelefono").numeric();
	        $("#txtCelular").numeric();
	        $("#txtNombres").alpha();
	        $("#txtApellidoPaterno").alpha();
	        $("#txtApellidoMaterno").alpha();
	        //$("#txtTelefono").numeric()
	        $("#txtTelefono").focus(function(){
	        	if($("#txtNumeroDocumento").val().length==0){
	        		$("#txtNumeroDocumento").focus();
	        	}
			});
	        $("#txtCelular").focus(function(){
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
	        /*$('#txtTelefono').popover({
				placement:'left',
				trigger:'click',
				html: true,
				content:'<span class="text-danger input-lg" style="padding:0px;font-size: 12px;" >El Tel�fono debe ser mayor o igual a 6</span>'
			});*/
		});
   	</script>
   	
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
			
			function fxMinimoTelefono() {
				var tamano=$("#txtTelefono").val().length;
				if(tamano<6 && tamano>0){
					$("#formTelefono").addClass("has-error");
					$("#spanTelefono").show();
					$("#txtTelefono").focus();
				}else{
					$("#formTelefono").removeClass("has-error");
					$("#spanTelefono").hide();
				}
		    }
			
			function fxMinimoCelular() {
				var tamano=$("#txtCelular").val().length;
				if(tamano<9 && tamano>0){
					$("#formCelular").addClass("has-error");
					$("#spanCelular").show();
					$("#txtCelular").focus();
				}else{
					$("#formCelular").removeClass("has-error");
					$("#spanCelular").hide();
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
		   
        </script>
  </body>
</html>
