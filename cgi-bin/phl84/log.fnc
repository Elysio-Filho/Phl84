<function name="log">

     <field action="import" tag="list">1/99999</field>

     <file action="append" type="output"><pft>,'LOG's(date).6,</pft></file>
     
     <display>
       <pft>,s(date).15,'|',v3000^2,'|',v3000^e,'|',v3000^x,'|MFN#'v3000^y,'|ERR#',v3000^w,'|'v3000^z/,</pft>
     </display>

     <file action="close" type="output"><pft>,'LOG's(date).6,</pft></file>

</function>