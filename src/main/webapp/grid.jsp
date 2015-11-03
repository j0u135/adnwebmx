<!DOCTYPE html>
<html lang="es">
<head>
  <title>ADN</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="admin-themes-adn">
  <meta name="author" content="adn">
  <link rel="shortcut icon" href="favicon.png" type="image/png"> 
 <!--CSS.Custom-->
    <link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link href="EstilosADN/style.css" rel="stylesheet">
    <link href="EstilosADN/theme.css" rel="stylesheet">
    <link href="EstilosADN/ui.css" rel="stylesheet">
    <!--/CSS.Custom-->
   <!--CSS.Old-->
    <LINK href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
    <link  href="EstilosADN/jquery-ui.css" rel="stylesheet" type="text/css">
    <link  href="EstilosADN/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link  href="EstilosADN/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--/CSS-Old--> 
	
</head>
<%@page import="java.util.ArrayList"%>
<%@ page import = "com.adn.controlador.IndicadorInteligente"%>
<%@ page import = "com.adn.controlador.Prioridad"%> 
<%@page import="com.adn.controlador.HojaRumbo"%>
<%
String usuario = "";
String nombre1 = "";
String puesto = "";
String tipo = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
nombre1 = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
tipo = (String)sesionOk.getAttribute("tipo");
}
ArrayList<IndicadorInteligente> arrIndInte = (ArrayList<IndicadorInteligente>)request.getAttribute("indicadores");
ArrayList<Prioridad> arrProyectosP = (ArrayList<Prioridad>) request.getAttribute("proyectosPrio");
ArrayList<HojaRumbo> arrHR=(ArrayList<HojaRumbo>) request.getAttribute("hojas");
ArrayList<HojaRumbo> hojaRumboArr=(ArrayList<HojaRumbo>) request.getAttribute("hojasEquipo");

String mes = (String) request.getAttribute("mesEnviado");
String mesNumerico = (String) request.getAttribute("mesNumerico");
int mesNum = Integer.parseInt(mesNumerico);

			

%>
<body>
	
<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>
    <!-- BEGIN MAIN CONTENT -->
<div class="principal containernuevo">    
  <div class="page-content page-sidebar-top">
    <div class="row central">
<!-- BEGIN GADGETS-FIJOS-IZQ-->
<div class=" col-lg-8 col-md-10 col-sm-12 ui-sortable"  id="gadgets-izquierda">
 <div class="">
  <!-- BEGIN NUMEROS INTELIGENTES -->
  <h4 class="m-b-10 tituloGrid"><i class="fa fa-line-chart"></i> <strong>Números Inteligentes Periodo <%=mes%> 2015</strong></h4>
  <div class="row">
    
    <%
    if(arrIndInte!=null && arrIndInte.size()>0){
    	for(int i=0; i<arrIndInte.size(); i++){
    		IndicadorInteligente indInte = arrIndInte.get(i);
    		if(indInte!=null){
    			%>
    
    			
               <input type="hidden" name="" id="numInd" value="<%=arrIndInte.size()%>">			
    			<div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 grid" >
    		    <div class="panel-header bd-6 tope tituloazul"><strong><%=indInte.getNombre()%></strong></div>
    		      <div class="panel bd-9" style="margin-bottom:0px">
    		        <div class="panel-content noeditablevista widget-info3 abajo">
    		          <div class="row">
    		            <div class="left">
    		              <img class="img-responsive flecha" id="flechaInd<%=i%>">
    		            </div>
    		            <div class="right">
    		            
    		               <p class="text m-r-5" id="texto">Meta</p>
    		               <strong class="text" style="color:white;" id="sufijo"></strong>
    		               <strong  id="metaInd<%=i%>"><%=indInte.getMeta()%></strong>
    		               
    		            </div>
    		            <div class="right">
    		               <p class="text m-r-5" id="texto">Real</p>
    		               <strong class="text" style="color:white;" id="sufijo">.</strong>
    		               <strong  id="resInd<%=i%>"><%=indInte.getResultado()%></strong>
    		            </div>
    		            <div class="right">
    		               <p class="text m-r-5" id="texto">Diff</p>
    		               <strong class="text" style="color:white;" id="sufijo">.</strong>
    		               <strong class="" id="difInd<%=i%>">200</strong>
    		               <input type="hidden" name="" id="sen<%=i%>" value="<%=indInte.getSentido()%>">	
    		               <input type="hidden" name="" id="uni<%=i%>" value="<%=indInte.getUnidad()%>">	
    		               
    		            </div>
    		          </div>
    		        </div>
    		      </div>
    		    </div>
    <%		}
    		
    	}
    	
    	int resI=5-arrIndInte.size();
    
    	for(int i=0; i<resI; i++){
    	
			%>
			 <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 grid ">
		    <div class="panel-header bd-6 tope tituloazul"><strong>Indicador Disponible</strong></div>
		      <div class="panel bd-9" style="margin-bottom:0px">
		        <div class="panel-content noeditablevista widget-info3 abajo">
		           <div class="center">
                  <a href="#" onclick="formato();"> <i class="fa fa-plus-circle"></i></a>
               
                  </div>
		        </div>
		      </div>
		    </div>
			<%	
		}
    	
    }
    %>
    
    
  </div><!--/.row m-t-10 -->
  <!--END NUMEROS INTELIGENTES -->

 <!-- BEGIN PRIORIDADES-->

  <h4 class="m-b-10 tituloGrid"><i class="fa fa-exclamation-circle"></i> <strong>Prioridades Periodo: <%=mes %> 2015	</strong> </h4>
  <div class="row m-t-10">
   <%
    String[] resultadosAnual= new String[12];
	String[] planeadosAnual= new String[12];
    if(arrProyectosP!=null && arrProyectosP.size()>0){
    	for(int j=0; j<arrProyectosP.size(); j++){
    		Prioridad proyPrio = arrProyectosP.get(j);
    		if(proyPrio!=null){
    			
    			resultadosAnual[0]=proyPrio.getResEne()!=(null)?proyPrio.getResEne():"0";
				resultadosAnual[1]=proyPrio.getResFeb()!=(null)?proyPrio.getResFeb():"0";
				resultadosAnual[2]=proyPrio.getResMar()!=(null)?proyPrio.getResMar():"0";
				resultadosAnual[3]=proyPrio.getResAbr()!=(null)?proyPrio.getResAbr():"0";
				resultadosAnual[4]=proyPrio.getResMay()!=(null)?proyPrio.getResMay():"0";
				resultadosAnual[5]=proyPrio.getResJun()!=(null)?proyPrio.getResJun():"0";
				resultadosAnual[6]=proyPrio.getResJul()!=(null)?proyPrio.getResJul():"0";
				resultadosAnual[7]=proyPrio.getResAgo()!=(null)?proyPrio.getResAgo():"0";
				resultadosAnual[8]=proyPrio.getResSep()!=(null)?proyPrio.getResSep():"0";
				resultadosAnual[9]=proyPrio.getResOct()!=(null)?proyPrio.getResOct():"0";
				resultadosAnual[10]=proyPrio.getResNov()!=(null)?proyPrio.getResNov():"0";
				resultadosAnual[11]=proyPrio.getResDic()!=(null)?proyPrio.getResDic():"0";

				planeadosAnual[0]=proyPrio.getMetaEne()!=(null)?proyPrio.getMetaEne():"0";
				planeadosAnual[1]=proyPrio.getMetaFeb()!=(null)?proyPrio.getMetaFeb():"0";
				planeadosAnual[2]=proyPrio.getMetaMar()!=(null)?proyPrio.getMetaMar():"0";
				planeadosAnual[3]=proyPrio.getMetaAbr()!=(null)?proyPrio.getMetaAbr():"0";
				planeadosAnual[4]=proyPrio.getMetaMay()!=(null)?proyPrio.getMetaMay():"0";
				planeadosAnual[5]=proyPrio.getMetaJun()!=(null)?proyPrio.getMetaJun():"0";
				planeadosAnual[6]=proyPrio.getMetaJul()!=(null)?proyPrio.getMetaJul():"0";
				planeadosAnual[7]=proyPrio.getMetaAgo()!=(null)?proyPrio.getMetaAgo():"0";
				planeadosAnual[8]=proyPrio.getMetaSep()!=(null)?proyPrio.getMetaSep():"0";
				planeadosAnual[9]=proyPrio.getMetaOct()!=(null)?proyPrio.getMetaOct():"0";
				planeadosAnual[10]=proyPrio.getMetaNov()!=(null)?proyPrio.getMetaNov():"0";
				planeadosAnual[11]=proyPrio.getMetaDic()!=(null)?proyPrio.getMetaDic():"0";
    			
    			%>
     <input type="hidden" name="" id="numP" value="<%=arrProyectosP.size()%>">	
    <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 grid  ">
    <div class="panel-header bd-6 tope tituloazul"><strong><%=proyPrio.getNombre()%></strong></div>
      <div class="panel bd-9">
        <div class="panel-content noeditablevista widget-info3 abajo">
          <div class="row">
            <div class="left">
              <img class="img-responsive flecha" id="flechaP<%=j%>">
            </div>
            <div class="right">
               <p class="text m-r-10" id="texto">Meta:</p>
               <strong class="text" style="color:white;" id="sufijo"></strong>
               <strong  id="metaP<%=j%>"><%=planeadosAnual[mesNum]%></strong>
            </div>
            <div class="right">
               <p class="text m-r-10" id="texto">Real:</p>
               <strong class="text" style="color:white;" id="sufijo">.</strong>
               <strong  id="resP<%=j%>"><%=resultadosAnual[mesNum] %></strong>
            </div>
            <div class="right ">
               <p class="text m-r-10" id="texto">Diff:</p>
               <strong class="text" style="color:white;" id="sufijo">..</strong>
               <strong class="" id="difP<%=j%>">20</strong>
            </div>
          </div>
        </div>
      </div>
    </div> <!-- col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 bd-6 -->
    <%		}
    	}
    	int res=5-arrProyectosP.size();
    	for(int i=0; i<res; i++){
    	
			%>
			 <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 grid">
		    <div class="panel-header  bd-6 tope tituloazul"><strong>Prioridad Disponible</strong></div>
		      <div class="panel bd-9" style="margin-bottom:0px">
		        <div class="panel-content noeditablevista widget-info3 abajo">
		           <div class="center">
                  <a href="#" onclick="formato();"> <i class="fa fa-plus-circle"></i></a>
               
                  </div>
		        </div>
		      </div>
		    </div>
			<%	
		}
    }
    %>
  </div><!--/.row m-t-10 -->
  <!--END PRIORIDADES -->
</div><!--Div Prioridades y NIs -->
<div class=" row">
    <div style="width:95%; margin-left:20px;">
          <div class="panel-header">
          <h4 class="m-b-10 tituloGrid"><i class="glyphicon glyphicon-dashboard "></i> <strong>Resumen de Desempeño</strong> </h4>
        </div>
      <div class="panel sombra bd-9">
      <div class="withScroll"  style="height:185px !important;">
      <table class="table table-striped">
        <thead>
          <tr>
            <th class="bg-white">NIs</th>
            <th class="bg-white">Prioridades</th>
            <th class="bg-white">Total</th>
            <th class="bg-white">Meses evaluados</th>
         </tr>
        </thead>
       <tbody>
         
            <tr>
              <td class="bg-white"><strong class="c-primary">100%</strong></td>
              <td class="bg-white"><strong class="c-primary">100%</strong></td>
              <td class="bg-white"><strong class="c-primary">100%</strong></td>
              <td class="bg-white"><strong class="c-red"> 4</strong></td>
            </tr>          
      </tbody>
      </table>
       
       <div id="container" style="max-width: 99%; height: 200px; margin: 0 auto"></div>
          
      
      </div>                 
      </div>
    </div><!-- col-md-6 -->
    
</div><!-- /.row-->
</div> <!-- FINAL GADGETS-FIJOS-IZQ -->

<!-- BEGIN GADGETS-DERECHA-->
<div class="col-lg-4 col-md-10 col-sm-10 ui-sortable containernuevo" id="gadgets-derecha">


<!-- BEGIN MI EQUIPO-->
  
  <div id="gadgets-mi-equipo">
  <div class="panel-header">
       <h4 class="tituloGrid"]><i class="icon-user "></i> <strong>Mi Equipo</strong> </h4>
     </div>
   <div class="panel widget-member mCustomScrollbar sombra bd-9"  >
      
     <div class="panel-content widget-news">
       <div class="withScroll"  data-height="580">
         
         
                        <%
    if(hojaRumboArr!=null && hojaRumboArr.size()>0){
    	for(int i=0; i<hojaRumboArr.size(); i++){
    		HojaRumbo HR = hojaRumboArr.get(i);
    		if(HR!=null){
    			%>
                 
    	 <a href="#" class="message-item media">
            <div class="media">
              <div class="media-body">
                <div class="pull-left p-r-10">
                  <i class="glyphicon glyphicon-user pull-left"></i>
                </div>
                <div>
                    <p class="f-14"><%=HR.getUsuario() %></p>
                </div>
              </div>
            </div>
          </a>    		
    			
               
    <%		}
    		
    	   }
    	
         }
               %>   
         
        
          
          
      </div><!--withScroll -->
    </div><!--/.panel-content .widget-news-->    
  </div><!-- /.panel .widget-member .mCustomScrollbar #mi-equipo-->
  </div>
<!--END MI EQUIPO -->

  <!-- BEGIN TAREAS-->
<div class="panel widget-tareas mCustomScrollbar" id="gadgets-tareas">
    <div class="panel-header">
     <h4><i class="icon-list tituloGrid"></i> <strong>Tareas</strong></h4>
   </div><!-- /.panel-header-->

   <div class="panel-content">
     <div class="withScroll">

        <div id="tarea" class=" message-item media  badge-success">
         <div class="media ">
           <div class="media-body">
            <small class="f-14 c-white">
              TAREAS COMPLETADAS
            </small>
            <small class="pull-right c-white"><strong>PRIORIDAD</strong></small>

            <ul class="fa-ul">
             <li>
              <a href="#">
                <p class="f-12 c-white">
                  Detalle de la tarea.
                  <small class="pull-right c-white"><strong>Alta</strong></small>
                </p>
              </a>
            </li>
            <li>
              <a href="#">
               <p class="f-12 c-white">
                 Detalle de la tarea.
                 <small class="pull-right c-white"><strong>Baja</strong></small>
               </p>
             </a>
           </li>
         </ul>
       </div>
     </div>
   </div><!-- /#tarea .message-item .media .badge-success-->

   <div id="tarea" class=" message-item media badge-primary ">
    <div class="media ">
      <div class="media-body">
       <small class="f-14 c-white">
         TAREAS EN PROGRESO
       </small>
       <small class="pull-right c-white"><strong>PRIORIDAD</strong></small>

       <ul class="fa-ul">
         <li>
          <a href="#">
            <p class="f-12 c-white">
              Detalle de la tarea.
              <small class="pull-right c-white"><strong>Alta</strong></small>
            </p>
          </a>
        </li>
        <li>
          <a href="#">
           <p class="f-12 c-white">
             Detalle de la tarea.
             <small class="pull-right c-white"><strong>Baja</strong></small>
           </p>
         </a>
       </li>
     </ul>

   </div>
  </div>
  </div><!-- /#tarea .message-item .media .badge-success-->

  <div id="tarea" class=" message-item media badge-danger ">
   <div class="media ">
     <div class="media-body">
      <small class="f-14 c-white">
        TAREAS CERRADAS
      </small>
      <small class="pull-right c-white"><strong>PRIORIDAD</strong></small>

      <ul class="fa-ul">
       <li>
        <a href="#">
          <p class="f-12 c-white">
            Detalle de la tarea.
            <small class="pull-right c-white"><strong>Alta</strong></small>
          </p>
        </a>
      </li>
      <li>
        <a href="#">
         <p class="f-12 c-white">
           Detalle de la tarea.
           <strong class="pull-right c-white"><strong>Baja</strong></strong>
         </p>
       </a>
       </li>
     </ul>
   </div>
  </div>
  </div><!-- /#tarea .message-item .media .badge-success-->

</div><!--/.withScroll -->
</div><!--/.panel-content-->
</div><!--/.panel widget-tareas mCustomScrollbar -->
<!-- END TAREAS-->

<!-- BEGIN JUNTAS-->
  <div class="panel widget-juntas mCustomScrollbar" id="gadgets-juntas">
   <div class="panel-header">
     <h4><i class="fa fa-group"></i> <strong>Juntas</strong></h4>
   </div><!-- /.panel-header-->
 
     <div class="withScroll">
      <div class="panel-content">
        <ul class="todo-list ui-sortable">
          <li class="low">
            <span class="todo-task f-14">TITULO DE LA JUNTA</span>
            <div class="todo-date clearfix">
              <div class="completed-date"></div>
              <div class="due-date"><p>Tareas de la Junta</p><span class="due-date-span">15/12/15</span></div>
            </div>
            <div class="todo-tags pull-right">
              <div class="label label-warning">EN CURSO</div>
            </div>
          </li>
          <li class="high">
            <span class="todo-task f-14">TITULO DE LA JUNTA</span>
            <div class="todo-date clearfix">
              <div class="completed-date"></div>
              <div class="due-date"><p>Tareas de la Junta</p><span class="due-date-span">15/12/15</span></div>
            </div>
            <div class="todo-tags pull-right">
              <div class="label label-danger">CERRADA</div>
            </div>
          </li>
        </ul>
      </div><!--/.panel-conten -->
    </div><!--/.withScroll -->

  </div><!--/.panel widget-juntas mCustomScrollbar -->
<!-- END JUNTAS-->

<!-- BEGIN CALENDARIO-->
  <div id="gadgets-calendario">
  <div class="panel-header">
     <h4 class="tituloGrid"><i class="icon-calendar"></i> <strong>DashBoard</strong></h4>
   </div><!-- /.panel-header-->
  <div class="panel widget-member mCustomScrollbar sombra bd-9"  >
      
     <div class="panel-content widget-news">
       <div class="withScroll"  data-height="580">
         <a href="#" class="message-item media">
            <div class="media">
              <div class="media-body">
                <div class="pull-left p-r-10">
                  <i class="glyphicon glyphicon-dashboard pull-left"></i>
                </div>
                <div>
                    <p class="f-14">General</p>
                </div>
              </div>
            </div>
          </a>    
          <a href="#" class="message-item media">
            <div class="media">
              <div class="media-body">
                <div class="pull-left p-r-10">
                  <i class="glyphicon glyphicon-dashboard pull-left"></i>
                </div>
                <div>
                    <p class="f-14">Financiero</p>
                </div>
              </div>
            </div>
          </a>
           <a href="#" class="message-item media">
            <div class="media">
              <div class="media-body">
                <div class="pull-left p-r-10">
                  <i class="glyphicon glyphicon-dashboard pull-left"></i>
                </div>
                  <p class="f-14">Disponible</p>
         
              </div>
            </div>
          </a>
           <a href="#" class="message-item media">
            <div class="media">
              <div class="media-body">
                <div class="pull-left p-r-10">
                  <i class="glyphicon glyphicon-dashboard pull-left"></i>
                </div>
                <div>
                    <p class="f-14">Disponible</p>
                </div>
              </div>
            </div>
          </a>
      </div><!--withScroll -->
    </div><!--/.panel-content .widget-news-->    
  </div><!-- /.panel .widget-member .mCustomScrollbar #mi-equipo-->
</div>
<!-- END CALENDARIO-->

<!-- BEGIN FRAME-->
<div class="panel mCustomScrollbar" id="gadgets-frame">
   <div class="panel-header">
      <h4>
        <i class="icon-frame"></i>
        <strong>Frame</strong>
        <div class="pull-right" data-toggle="modal" data-target="#modal-basic">
          <i class="fa fa-cogs"></i>
        </div>
      </h4>
   </div><!-- /.panel-header-->
   <div class="panel-content">
      <div class="withScroll"></div><!--/.withScroll -->
  </div><!--/.panel-content-->
</div><!--/.panel .mCustomScrollbar #gadgets-frame -->
<!-- END FRAME-->

<!-- BEGIN DESENPEÑO-->
  <div class="" id="gadgets-desempeno">
   <div >
      <div class="panel-header">
        <h4 class="m-b-10 tituloGrid"><i class="icon-star"></i><strong>Aprobaciones</strong></h4>
      </div>
              <div class="panel-header">
              
              <div class="input-group margin-bottom-sm">
			 <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-eye fa-fw"></i></span>
           									<select name="meses" id="meses" class="form-control input-xs">
           									<option name="meses1" value="meses1">
                            					<a href="#" class="reorder-menu">Trimestre 1</a>
                          					</option>
                          					<option name="meses2" value="meses2">
                            					<a href="#" class="reorder-menu">Trimestre 2</a>
                         					 </option>
                          					<option name="meses3" value="meses3">
                            					<a href="#" class="reorder-menu">Trimestre 3</a>
                          					</option>
                          					<option name="meses4" value="meses4">
                            					<a href="#" class="reorder-menu">Trimestre 4</a>
                         					</option>
           									
           									</select>
									           					           
		      </div>
              
              
        </div>
      <div class="panel">
        <div class="panel-content widget-table sombra b-9">
          <div class="withScroll" data-height="150">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="bg-adn-blue">Mes</th>
                  <th class="bg-adn-blue"> Estatus</th>
                  <th class="bg-adn-blue"> Fecha</th>
                </tr>
              </thead>
              <tbody>
    
                  <%
    if(arrHR!=null && arrHR.size()>0){
    	for(int i=0; i<arrHR.size(); i++){
    		HojaRumbo HR = arrHR.get(i);
    		if(HR!=null){
    			%>
                 <tr class="mes1">
                    <td><%=HR.getMes()%></td>
                    <td>
                      <div class="badge badge-danger"><%=HR.getEstatus()%></div>
                    </td>
                    <td><%=HR.getLiberacion()%></td>
                  </tr>
    			
               
    <%		}
    		
    	   }
    	
         }
               %>   
                  
           </tbody>
            </table>
          </div>
        </div>

      </div>
      
    </div><!-- col-md-6 -->  
   </div><!--/.panel .mCustomScrollbar #gadgets-desempeño -->
<!-- END DESENPEÑO-->


</div><!-- /.col-md-4 -->
<!-- END GADGETS-DERECHA-->  


<!-- BEGIN MODAL-->
<div class="modal fade" id="modal-basic" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icons-office-52"></i></button>
        <h4 class="modal-title"><strong>Modal Frame</strong></h4>
      </div>
      <div class="modal-body">
        <input type="text" class="form-control" placeholder="Ingrese su URL...">
     </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-embossed" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary btn-embossed" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- END MODAL-->            
         
</div><!-- END PAGE CONTENT -->
</div> <!-- END MAIN CONTENT -->

<!-- BEGIN BUILDER -->
<div class="builder" id="builder">
      <a class="builder-toggle">
          <i class="icon-wrench"></i>
      </a>
  <div class="inner">
    <div class="builder-container">
      <h4>Configuracion de Gadgets</h4>            
      <p>Zona de configuracion de Gadget</p>
      <div class="layout-option">
        <span> Mi equipo</span>
        <label class="switch pull-right">
          <input type="checkbox" class="switch-input" id="g-equipo" name="g-equipo" checked>
          <span data-layout="g-equipo" class="switch-label" id="g-equipo" data-on="On" data-off="Off" ></span>
          <span class="switch-handle"></span>
        </label>
      </div><!-- /.layout-option -->

      <div class="layout-option">
        <span> Tareas</span>
        <label class="switch pull-right">
          <input type="checkbox" class="switch-input" id="g-tareas" name="g-tareas" >
          <span data-layout="g-tareas" class="switch-label" id="g-tareas" data-on="On" data-off="Off"></span>
          <span class="switch-handle"></span>
        </label>
      </div><!-- /.layout-option -->

      <div class="layout-option">
        <span> Juntas</span>
        <label class="switch pull-right">
          <input type="checkbox" class="switch-input" id="g-juntas" name="g-juntas" >
          <span data-layout="g-juntas" class="switch-label" id="g-juntas" data-on="On" data-off="Off"></span>
          <span class="switch-handle"></span>
        </label>
      </div><!-- /.layout-option -->

      <div class="layout-option">
        <span> DashBoard</span>
        <label class="switch pull-right">
          <input type="checkbox" class="switch-input" id="g-cal" name="g-cal" >
          <span data-layout="g-cal" class="switch-label" id="g-cal" data-on="On" data-off="Off"></span>
          <span class="switch-handle"></span>
        </label>
      </div><!-- /.layout-option -->

      <div class="layout-option">
        <span>Gadgets Frame</span>
        <label class="switch pull-right">
          <input type="checkbox" class="switch-input" id="g-frame" name="g-frame" >
          <span data-layout="g-frame" class="switch-label" id="g-frame" data-on="On" data-off="Off"></span>
          <span class="switch-handle"></span>
        </label>
      </div><!-- /.layout-option -->

      <div class="layout-option">
        <span>Aprobaciones</span>
        <label class="switch pull-right">
          <input type="checkbox" class="switch-input" id="g-desempeno" name="g-desempeno" >
          <span data-layout="g-desempeno" class="switch-label" id="g-desempeno" data-on="On" data-off="Off"></span>
          <span class="switch-handle"></span>
        </label>
      </div><!-- /.layout-option -->
      <p>*La zona de Gadgets, solo puede tener 3 Gadgets activos.</p>
    </div>
  </div>
</div>
<!-- END BUILDER -->
</section>

   
    <div class="loader-overlay">
      <div class="spinner">
        <div class="bounce1"></div>
        <div class="bounce2"></div>
        <div class="bounce3"></div>
      </div>
    </div>
    
</div>

    <a href="#" class="scrollup"><i class="fa fa-angle-up"></i></a> 
    <script src="plugins/jquery/jquery-1.11.1.min.js"></script>
    <script src="js/accounting.min.js"></script>
    <script src="js/highcharts.js"></script>
    <script src="js/modulos/exporting.js"></script>
    <script src="plugins/jquery/jquery-migrate-1.2.1.min.js"></script>
    <script src="plugins/jquery-ui/jquery-ui-1.11.2.min.js"></script>
    <script src="plugins/gsap/main-gsap.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/jquery-cookies/jquery.cookies.min.js"></script> <!-- Jquery Cookies, for theme -->
    <script src="plugins/bootbox/bootbox.min.js"></script> <!-- Modal with Validation -->
    <script src="plugins/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script> <!-- Custom Scrollbar sidebar -->
    <script src="plugins/bootstrap-dropdown/bootstrap-hover-dropdown.min.js"></script> <!-- Show Dropdown on Mouseover -->
    <script src="plugins/icheck/icheck.min.js"></script> <!-- Checkbox & Radio Inputs -->
    <script src="plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script> <!-- Animated Progress Bar -->
    <script src="js/builder.js"></script> <!-- Theme Builder -->
    <script src="js/sidebar_hover.js"></script> <!-- Sidebar on Hover -->
    <script src="js/application.js"></script> <!-- Main Application Script -->
  
  
  <script>
  $(function () {
	    $('#container').highcharts({
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: null
	        },
	        
	        xAxis: {
	            categories: [
	                'Ene',
	                'Feb',
	                'Mar',
	                'Abr',
	                'May',
	                'Jun',
	                'Jul',
	                'Ago',
	                'Sep',
	                'Oct',
	                'Nov',
	                'Dic'
	            ],
	            crosshair: true
	        },
	        yAxis: {
	            min: 0,
	            max: 100,
	            title: {
	                text: null
	            }
	        },
	        tooltip: {
	            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	                '<td style="padding:0"><b>{point.y:.1f} %</b></td></tr>',
	            footerFormat: '</table>',
	            shared: true,
	            useHTML: true
	        },
	        plotOptions: {
	            column: {
	                pointPadding: 0.2,
	                borderWidth: 0
	            }
	        },
	        series: [{
	            name: 'HDR',
	            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

	        }, {
	            name: 'NIs',
	            data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

	        }, {
	            name: 'PRIORIDADES',
	            data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

	        }]
	    });
	});
   </script>
   
   <script>
   function toggleBuilder(){
       $('.builder-toggle').on('click', function(){
           if($('#builder').hasClass('open')) $('#builder').removeClass('open');
           else $('#builder').addClass('open');
       });
   }
   </script>
    <script>
    //Function Show and Hide #meses
    $(document).ready(function() {
      var oculto=$('.mes4,.mes3,.mes2');
      oculto.hide();  
    $('#meses').change(function(){
         if($('#meses').val() == 'meses2') {
             $('.mes2').show();
             $('.mes4,.mes3,.mes1').hide();
           } 
        else if($('#meses').val() == 'meses3') {
             $('.mes3').show();
             $('.mes4,.mes2,.mes1').hide();
           }
        else if($('#meses').val() == 'meses4') {
             $('.mes4').show();
             $('.mes3,.mes2,.mes1').hide();
           } 
        else if($('#meses').val() == 'meses1') {
             $('.mes1').show();
             $('.mes3,.mes2,.mes4').hide();
           }  
     });
    });
  </script>
  <script>
  //Function withScroll
  $(document).ready(function(){
  $('#mCSB_1').click(function(){ 
  var inputs=$("#mCSB_1").find($("input:checked"));
  var count=inputs.length; 
  switch (count)
  { 
    case 1:
    $('#gadgets-mi-equipo .withScroll').attr("style", "height:570px");
    $('#gadgets-tareas .withScroll').attr("style", "height:570px");
    $('#gadgets-juntas .withScroll').attr("style", "height:580px");
    $('#gadgets-calendario .withScroll').attr("style", "height:570px");
    $('#gadgets-desempeno .withScroll').attr("style", "height:570px");
    $('#gadgets-frame .withScroll').attr("style", "height:570px");
    break;
    case 2:
    $('#gadgets-mi-equipo .withScroll').attr("style", "height:230px");
    $('#gadgets-tareas .withScroll').attr("style", "height:230px");
    $('#gadgets-juntas .withScroll').attr("style", "height:230px");
    $('#gadgets-calendario .withScroll').attr("style", "height:230px");
    $('#gadgets-desempeno .withScroll').attr("style", "height:230px");
    $('#gadgets-frame .withScroll').attr("style", "height:230px");
    
    break;
    case 3: 
     $('#gadgets-mi-equipo .withScroll').attr("style", "height:125px");
     $('#gadgets-tareas .withScroll').attr("style", "height:125px");
     $('#gadgets-juntas .withScroll').attr("style", "height:125px");
     $('#gadgets-calendario .withScroll').attr("style", "height:125px");
     $('#gadgets-desempeno .withScroll').attr("style", "height:125px");
     $('#gadgets-frame .withScroll').attr("style", "height:125px");
     break;
  }     
    
  });
  
});
  </script>
  <script>
  //Function Show and Hide #gadgets
  $(document).ready(function(){
    var oculto=$('#gadgets-tareas,#gadgets-juntas,#gadgets-calendario,#gadgets-desempeno,#gadgets-frame');
    oculto.hide(); //#gadgets-mi-equipo, default
    //Gadgets Equipo
        $('#g-equipo').click(function(){
          var inputs=$("#mCSB_1").find($("input:checked"));
          var count=inputs.length;        
            if($(this).prop('checked') == true){ 
                if(count > 3){
                  alert("La zona de Gadgets solo puede contener 3 elementos");
                  $(this).removeProp('checked');
                }
                else 
                {$('#gadgets-mi-equipo').show();}                       
  
            }        
            else        
            {            
                $('#gadgets-mi-equipo').hide();      
            }    
        });
    //Gadgets Tareas
        $('#g-tareas').click(function(){
          var inputs=$("#mCSB_1").find($("input:checked"));
          var count=inputs.length;           
            if($(this).prop('checked') == true){
              if(count > 3){
                alert("La zona de Gadgets solo puede contener 3 elementos");
                $(this).removeProp('checked');
              } else 
              {$('#gadgets-tareas').show();}            
    
            }        
            else
              {$('#gadgets-tareas').hide();}    
        }); 
    //Gadgets Juntas
        $('#g-juntas').click(function(){ 
        var inputs=$("#mCSB_1").find($("input:checked"));
        var count=inputs.length;         
            if($(this).prop('checked') == true){ 
              if(count > 3){
                alert("La zona de Gadgets solo puede contener 3 elementos");
                $(this).removeProp('checked');
              } else 
              {$('#gadgets-juntas').show();}                  
            }        
            else        
            {$('#gadgets-juntas').hide();}    
        });
    //Gadgets Calendario
        $('#g-cal').click(function(){
        var inputs=$("#mCSB_1").find($("input:checked"));
        var count=inputs.length;           
            if($(this).prop('checked') == true){
              if(count > 3){
                alert("La zona de Gadgets solo puede contener 3 elementos");
                $(this).removeProp('checked');
              } else 
              {
                $('#gadgets-calendario').show(); 
              }                 
            }        
            else        
            {            
                $('#gadgets-calendario').hide();      
            }    
        });    
    //Gadgets Frame
        $('#g-frame').click(function(){
        var inputs=$("#mCSB_1").find($("input:checked"));
        var count=inputs.length;        
            if($(this).prop('checked') == true){ 
              if(count > 3){
                alert("La zona de Gadgets solo puede contener 3 elementos");
                $(this).removeProp('checked');
              } else 
              {$('#gadgets-frame').show();}
            }        
            else        
            {$('#gadgets-frame').hide();}    
        });    
    //Gadgets desempeno
        $('#g-desempeno').click(function(){
        var inputs=$("#mCSB_1").find($("input:checked"));
        var count=inputs.length;        
            if($(this).prop('checked') == true){ 
                if(count > 3){
                  alert("La zona de Gadgets solo puede contener 3 elementos");
                  $(this).removeProp('checked');
                } else 
                {$('#gadgets-desempeno').show();}
            }        
            else        
            {$('#gadgets-desempeno').hide();}    
        });       
  });
  
  
  </script>
<script>
function formato(){
	
	var num= document.getElementById("numInd").value;
    var arrMetaInd=[0,0,0,0,0];
    var arrResInd=[0,0,0,0,0];
    
    //Formato a la lista de indicadores
	//var sentido="Menos";
	
	

	
	
	
    
	for(var i=0; i<num;i++){
    	
		var Unidad= document.getElementById("uni"+i).value;
		arrMetaInd[i]=document.getElementById("metaInd"+i).innerHTML;
		arrResInd[i]=document.getElementById("resInd"+i).innerHTML
		if (Unidad=="Porcentaje"){
		var Meta = accounting.formatMoney(document.getElementById("metaInd"+i).innerHTML,{ symbol: "%",  format: "%v %s", precision : 1});
		var Resultado = accounting.formatMoney(document.getElementById("resInd"+i).innerHTML,{ symbol: "%",  format: "%v %s", precision : 1});
		var Cump = accounting.formatNumber(document.getElementById("difInd"+i).innerHTML,1,"");
		
		}else if(Unidad=="Monto"){
			var Meta = accounting.formatMoney(document.getElementById("metaInd"+i).innerHTML);
			var Resultado = accounting.formatMoney(document.getElementById("resInd"+i).innerHTML);
			var Cump = accounting.formatNumber(document.getElementById("difInd"+i).innerHTML,1,"");		
		}
		else{
			var Meta = accounting.formatNumber(document.getElementById("metaInd"+i).innerHTML,1,",");
			var Resultado = accounting.formatNumber(document.getElementById("resInd"+i).innerHTML,1,",");
			var Cump = accounting.formatNumber(document.getElementById("difInd"+i).innerHTML,1,"");		
			
		}
		 
		document.getElementById("metaInd"+i).innerHTML=Meta;
		document.getElementById("resInd"+i).innerHTML=Resultado;
		document.getElementById("difInd"+i).innerHTML=Cump;
    	
    	
    	var sentido= document.getElementById("sen"+i).value;
	    
		//asigna formato segun sentido del NI
		if(sentido=="Mas"){
			//calcula diferencia entre real y planeado
			var Dif = accounting.formatNumber(arrResInd[i]-arrMetaInd[i],1,",");
        	document.getElementById("difInd"+i).innerHTML=Dif;
        	if(Dif>=0){
            	document.getElementById("difInd"+i).className="c-green";
            	document.getElementById("flechaInd"+i).src="ImagenesADN/flecha-up.png";
            	}else{
            		document.getElementById("difInd"+i).className="c-red";
            		document.getElementById("flechaInd"+i).src="ImagenesADN/flecha-up-red.png";
            	}
		}else if(sentido=="Menos"){
			//calcula diferencia entre real y planeado
			var Dif = accounting.formatNumber(arrMetaInd[i]-arrResInd[i],1,",");
        	document.getElementById("difInd"+i).innerHTML=Dif;
        	//asigna formato al texto y flechas
        	if(Dif<0){
        		document.getElementById("difInd"+i).className="c-red";
        		document.getElementById("flechaInd"+i).src="ImagenesADN/flecha-down.png";
        	}else{
        		document.getElementById("difInd"+i).className="c-green";
        		document.getElementById("flechaInd"+i).src="ImagenesADN/flecha-down-green.png";
        	}
		}
    }
	 
	var num= document.getElementById("numP").value;
	var arrMetaP=[0,0,0,0,0];
    var arrResP=[0,0,0,0,0];

	//formato a la lista de prioridades
	for(var i=0; i<num;i++){

		
		
		
		arrMetaP[i]=document.getElementById("metaP"+i).innerHTML;
			var Meta = accounting.formatNumber(arrMetaP[i],1,",");
			document.getElementById("metaP"+i).innerHTML=Meta;
		arrResP[i]=document.getElementById("resP"+i).innerHTML;
			var Result = accounting.formatNumber(arrResP[i],1,",");
			document.getElementById("resP"+i).innerHTML=Result;
		
		//calcula diferencia entre real y planeado
		var Dif = accounting.formatNumber(arrResP[i]-arrMetaP[i],1,",")
		document.getElementById("difP"+i).innerHTML=Dif;
	
    	if(Dif>=0){
        	document.getElementById("difP"+i).className="c-green";
        	document.getElementById("flechaP"+i).src="ImagenesADN/flecha-up.png";
        	}else{
        		document.getElementById("difP"+i).className="c-red";
        		document.getElementById("flechaP"+i).src="ImagenesADN/flecha-up-red.png";
        	}
	
	}
	
	

}
</script>

</body>

<script>
formato();
</script>
</html>