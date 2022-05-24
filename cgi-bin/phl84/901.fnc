<!-- Define data de devolução
     02/07/2007 - Revisado -->
     
     <function name="901">

<!-- Importa variaveis para uso da funcao -->

     <field action="import" tag="list">802,953,1022,1026,7003</field>

     <!-- *************************************************************************
          Define data de devolução (dias corridos)
          ********************************************************************** -->
     
          <do task="mfnrange">
            <parm name="db"><pft>,v953'_cal'</pft></parm>
            <parm name="from"><pft>,f(val(v1022)+val(v1026)-1,0,0)</pft></parm>
            <loop>
              <flow action="skip">
                <pft>,
                   ,if v324='1' then

                    putenv('c_dev='v323,v322,v320),
                    putenv('c_mfn='mfn(1)) 'Quit' 
                    
                   ,fi,
                </pft>
              </flow>
            </loop>
          </do>
          <file action="close" type="database"><pft>,v953'_cal'</pft></file>
          
          
     <!-- *************************************************************************
          Define data de devolução (dias úteis)
          ********************************************************************** -->
          <do task="keyrange">
            <parm name="db"><pft>,v953'_cal'</pft></parm>
            <parm name="from"><pft>'UTL=',v7003.8,</pft></parm>
            <parm name="posting">All</parm>
            <field action="define" tag="1001">Isis_Current</field>
            <field action="define" tag="1">Isis_Key</field>
            <field action="define" tag="21">Isis_Posting</field>
            <parm name="count"><pft>,v1026,</pft></parm>
            <loop>
              <field action="import" tag="list">802,1026</field>
              <display>
                <pft>
                  ,if val(v1001)=val(v1026) then
                    ,putenv('u_dev='v1*4),
                    ,putenv('u_mfn='v21^m) 
                  ,fi,
                 </pft>
              </display>
            </loop>
          </do>
          <file action="close" type="database"><pft>,v953'_cal'</pft></file>
          
</function>
