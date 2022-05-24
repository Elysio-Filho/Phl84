<!-- Funcao que verifica estado de manutencao -->
     
     <function name="manutencao">
     
       <field action="import" tag="list">4001</field>

       <flow action="jump">
         <pft>,if ref(['phl_cnf']1,v201)='S' then 'manutencao' else 'exit' fi,</pft>
       </flow>
       <flow action="exit">0</flow>

       <label>manutencao</label>     
         <display><htmlpft><pft>,ref(['tab_fmx']46,v4),</pft></htmlpft></display>
       <flow action="exit">1</flow>
     
       <label>exit</label>
     
     </function>