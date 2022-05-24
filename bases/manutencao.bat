@echo off
@cls
echo =========================================================================
echo                                IMPORTANTE
echo =========================================================================
echo Antes de executar este procedimento recomendamos efetuar copia de seguranca
echo             do diretorio "c:\phl84\bases".
echo                               ******
echo Esta copia de seguranca eh necessaria porque se o processo for interrompido
echo      por algum motivo, uma ou mais bases de dados serao eliminadas!
echo                               ******
echo ** Se ainda nao efetuou esta copia, tecle [ctrl+c] para interromper o processo
echo ** Se a copia jah foi efetuada, tecle [enter] para continuar
pause > nul
@cls
echo ==========================================================================
echo ========================================================================== >> manutencao.txt
echo INICIO: - %date% - %time%
echo ==========================================================================
echo Este procedimento, dependendo do tamanho de suas bases de dados, pode
echo demorar alguns minutos. Seja paciente. Aguarde a finalizacao do processo!
echo ==========================================================================
echo INICIO: - %date% - %time% >> manutencao.txt
          retag phl_cnf unlock
          mx phl_cnf copy=phl_cnf "proc='d201d202','a201#S#','a202#Em manuten&ccedil;&atilde;o!#" -all now
echo  1 - Base de dados do calendario                                 (001_cal)
echo ========================================================================== >> manutencao.txt
          mx 001_cal +control now >> manutencao.txt
          retag 001_cal unlock >> manutencao.txt
          mxcp 001_cal create=xcal clean mintag=1 maxtag=999 >> manutencao.txt
          mx xcal create=001_cal -all now >> manutencao.txt
          del xcal.* >> manutencao.txt
          mx 001_cal fst=@ uctab=uctab actab=actab fullinv=001_cal -all now >> manutencao.txt
          mx 001_cal +control now >> manutencao.txt

echo  2 - Base de dados de classificacao                              (001_cdu)
echo ========================================================================== >> manutencao.txt
          mx 001_cdu +control now >> manutencao.txt
          retag 001_cdu unlock >> manutencao.txt
          mxcp 001_cdu create=xcdu clean mintag=1 maxtag=999 >> manutencao.txt
          mx xcdu create=001_cdu -all now >> manutencao.txt
          del xcdu.* >> manutencao.txt
          mx 001_cdu fst=@ uctab=uctab actab=actab fullinv=001_cdu -all now >> manutencao.txt
          mx 001_cdu +control now >> manutencao.txt

echo  3 - Base de dados do livro caixa                                (001_cxa)
echo ========================================================================== >> manutencao.txt
          mx 001_cxa +control now >> manutencao.txt
          retag 001_cxa unlock >> manutencao.txt
          mxcp 001_cxa create=xcxa clean mintag=1 maxtag=999 >> manutencao.txt
          mx xcxa create=001_cxa -all now >> manutencao.txt
          del xcxa.* >> manutencao.txt
          mx 001_cxa fst=@ uctab=uctab actab=actab fullinv=001_cxa -all now >> manutencao.txt
          mx 001_cxa +control now >> manutencao.txt

echo  4 - Base de dados de emprestimos                                (001_emp)
echo ========================================================================== >> manutencao.txt
          mx 001_emp +control now >> manutencao.txt
          retag 001_emp unlock >> manutencao.txt
          mxcp 001_emp create=xemp clean mintag=900 maxtag=900 >> manutencao.txt
          del 001_emp.mst
          del 001_emp.xrf
          mx xemp append=001_emp -all now >> manutencao.txt
          del xemp.* >> manutencao.txt
          mx 001_emp fst=@ uctab=uctab actab=actab fullinv=001_emp -all now >> manutencao.txt
          mx 001_emp +control now >> manutencao.txt

echo  5 - Base de dados de historicos                                 (001_log)
echo ========================================================================== >> manutencao.txt
          mx 001_log +control now >> manutencao.txt
          retag 001_log unlock >> manutencao.txt
          mxcp 001_log create=xlog clean mintag=910 maxtag=910 >> manutencao.txt
          mx xlog create=001_log -all now >> manutencao.txt
          del xlog.* >> manutencao.txt
          mx 001_log fst=@ uctab=uctab actab=actab fullinv=001_log -all now >> manutencao.txt
          mx 001_log +control now >> manutencao.txt

echo  6 - Base de dados do kardex                                     (001_ser)
echo ========================================================================== >> manutencao.txt
          mx 001_ser +control now >> manutencao.txt
          retag 001_ser unlock >> manutencao.txt
          mxcp 001_ser create=xser clean mintag=1 maxtag=999 >> manutencao.txt
          mx xser create=001_ser -all now >> manutencao.txt
          del xser.* >> manutencao.txt
          mx 001_ser fst=@ uctab=uctab actab=actab fullinv=001_ser -all now >> manutencao.txt
          mx 001_ser +control now >> manutencao.txt

echo  7 - Base de dados do formulario do kardex                   (001_ser_fmt)
echo ========================================================================== >> manutencao.txt
          mx 001_ser_fmt +control now >> manutencao.txt
          retag 001_ser_fmt unlock >> manutencao.txt
          mxcp 001_ser_fmt create=xserfmt clean mintag=1 maxtag=9999 >> manutencao.txt
          mx xserfmt create=001_ser_fmt -all now >> manutencao.txt
          del xserfmt.* >> manutencao.txt
          mx 001_ser_fmt fst=@ uctab=uctab actab=actab fullinv=001_ser_fmt -all now >> manutencao.txt
          mx 001_ser_fmt +control now >> manutencao.txt

echo  8 - Base de dados de tombo                                      (001_tbo)
echo ========================================================================== >> manutencao.txt
          mx 001_tbo +control now >> manutencao.txt
          retag 001_tbo unlock >> manutencao.txt
          mxcp 001_tbo create=xtbo clean mintag=800 maxtag=9999 >> manutencao.txt
          mx xtbo create=001_tbo -all now >> manutencao.txt
          del xtbo.* >> manutencao.txt
          mx 001_tbo fst=@ uctab=uctab actab=actab fullinv=001_tbo -all now >> manutencao.txt
          mx 001_tbo +control now >> manutencao.txt

echo  9 - Base de dados do formulario do tombo                    (001_tbo_fmt)
echo ========================================================================== >> manutencao.txt
          mx 001_tbo_fmt +control now >> manutencao.txt
          retag 001_tbo_fmt unlock >> manutencao.txt
          mxcp 001_tbo_fmt create=xtbofmt clean mintag=1 maxtag=9999 >> manutencao.txt
          mx xtbofmt create=001_tbo_fmt -all now >> manutencao.txt
          del xtbofmt.* >> manutencao.txt
          mx 001_tbo_fmt fst=@ uctab=uctab actab=actab fullinv=001_tbo_fmt -all now >> manutencao.txt
          mx 001_tbo_fmt +control now >> manutencao.txt

echo 10 - Base de dados de uso da colecao                             (001_usc)
echo ========================================================================== >> manutencao.txt
          mx 001_usc +control now >> manutencao.txt
          retag 001_usc unlock >> manutencao.txt
          mxcp 001_usc create=xusc clean mintag=1 maxtag=999 >> manutencao.txt
          mx xusc create=001_usc -all now >> manutencao.txt
          del xusc.* >> manutencao.txt
          mx 001_usc fst=@ uctab=uctab actab=actab fullinv=001_usc -all now >> manutencao.txt
          mx 001_usc +control now >> manutencao.txt

echo 11 - Base de dados do catalogo                                   (phl_acv)
echo ========================================================================== >> manutencao.txt
          mx phl_acv +control now >> manutencao.txt
          retag phl_acv unlock >> manutencao.txt
          mxcp phl_acv create=xacv clean mintag=1 maxtag=999 >> manutencao.txt
          mx xacv create=phl_acv -all now >> manutencao.txt
          del xacv.* >> manutencao.txt
          mx phl_acv fst=@ uctab=uctab actab=actab fullinv=phl_acv -all now >> manutencao.txt
          mx phl_acv +control now >> manutencao.txt

echo 12 - Base de dados de tipos de documentos                    (phl_acv_fmt)
echo ========================================================================== >> manutencao.txt
          mx phl_acv_fmt +control now >> manutencao.txt
          retag phl_acv_fmt unlock >> manutencao.txt
          mxcp phl_acv_fmt create=xacvfmt clean mintag=1 maxtag=9999 >> manutencao.txt
          mx xacvfmt create=phl_acv_fmt -all now >> manutencao.txt
          del xacvfmt.* >> manutencao.txt
          mx phl_acv_fmt fst=@ uctab=uctab actab=actab fullinv=phl_acv_fmt >> manutencao.txt
          mx phl_acv_fmt +control now >> manutencao.txt

echo 13 - Base de dados de tipos de aquisicao                         (phl_aqu)
echo ========================================================================== >> manutencao.txt
          mx phl_aqu +control now >> manutencao.txt
          retag phl_aqu unlock >> manutencao.txt
          mxcp phl_aqu create=xaqu clean mintag=1 maxtag=999 >> manutencao.txt
          mx xaqu create=phl_aqu -all now >> manutencao.txt
          del xaqu.* >> manutencao.txt
          mx phl_aqu fst=@ uctab=uctab actab=actab fullinv=phl_aqu -all now >> manutencao.txt
          mx phl_aqu +control now >> manutencao.txt

echo 14 - Base de dados de tipos de assinatura                        (phl_ass)
echo ========================================================================== >> manutencao.txt
          mx phl_ass +control now >> manutencao.txt
          retag phl_ass unlock >> manutencao.txt
          mxcp phl_ass create=xass clean mintag=1 maxtag=999 >> manutencao.txt
          mx xass create=phl_ass -all now >> manutencao.txt
          del xass.* >> manutencao.txt
          mx phl_ass fst=@ uctab=uctab actab=actab fullinv=phl_ass -all now >> manutencao.txt
          mx phl_ass +control now >> manutencao.txt

echo 15 - Base de dados de autoridades                                (phl_aut)
echo ========================================================================== >> manutencao.txt
          mx phl_aut +control now >> manutencao.txt
          retag phl_aut unlock >> manutencao.txt
          mxcp phl_aut create=xaut clean mintag=1 maxtag=999 >> manutencao.txt
          mx xaut create=phl_aut -all now >> manutencao.txt
          del xaut.* >> manutencao.txt
          mx phl_aut fst=@ uctab=uctab actab=actab fullinv=phl_aut -all now >> manutencao.txt
          mx phl_aut +control now >> manutencao.txt

echo 16 - Base de dados de configuracao do sistema                    (phl_cnf)
echo ========================================================================== >> manutencao.txt
          mx phl_cnf +control now >> manutencao.txt
          retag phl_cnf unlock >> manutencao.txt
          mxcp phl_cnf create=xcnf clean mintag=1 maxtag=999 >> manutencao.txt
          mx xcnf create=phl_cnf -all now >> manutencao.txt
          del xcnf.* >> manutencao.txt
          mx phl_cnf fst=@ uctab=uctab actab=actab fullinv=phl_cnf -all now >> manutencao.txt
          mx phl_cnf +control now >> manutencao.txt

echo 17 - Base de dados de tipos de conteudo                          (phl_cnt)
echo ========================================================================== >> manutencao.txt
          mx phl_cnt +control now >> manutencao.txt
          retag phl_cnt unlock >> manutencao.txt
          mxcp phl_cnt create=xcnt clean mintag=1 maxtag=999 >> manutencao.txt
          mx xcnt create=phl_cnt -all now >> manutencao.txt
          del xcnt.* >> manutencao.txt
          mx phl_cnt fst=@ uctab=uctab actab=actab fullinv=phl_cnt -all now >> manutencao.txt
          mx phl_cnt +control now >> manutencao.txt

echo 18 - Base de dados de tipos de colecao                           (phl_col)
echo ========================================================================== >> manutencao.txt
          mx phl_col +control now >> manutencao.txt
          retag phl_col unlock >> manutencao.txt
          mxcp phl_col create=xcol clean mintag=301 maxtag=999 >> manutencao.txt
          mx xcol create=phl_col -all now >> manutencao.txt
          del xcol.* >> manutencao.txt
          mx phl_col fst=@ uctab=uctab actab=actab fullinv=phl_col -all now >> manutencao.txt
          mx phl_col +control now >> manutencao.txt

echo 19 - Base de dados de sugestoes de compra                        (phl_cpa)
echo ========================================================================== >> manutencao.txt
          mx phl_cpa +control now >> manutencao.txt
          retag phl_cpa unlock >> manutencao.txt
          mxcp phl_cpa create=xcpa clean mintag=1 maxtag=999 >> manutencao.txt
          mx xcpa create=phl_cpa -all now >> manutencao.txt
          del xcpa.* >> manutencao.txt
          mx phl_cpa fst=@ uctab=uctab actab=actab fullinv=phl_cpa -all now >> manutencao.txt
          mx phl_cpa +control now >> manutencao.txt

echo 20 - Base de dados de tipos de cursos                            (phl_cur)
echo ========================================================================== >> manutencao.txt
          mx phl_cur +control now >> manutencao.txt
          retag phl_cur unlock >> manutencao.txt
          mxcp phl_cur create=xcur clean mintag=1 maxtag=999 >> manutencao.txt
          mx xcur create=phl_cur -all now >> manutencao.txt
          del xcur.* >> manutencao.txt
          mx phl_cur fst=@ uctab=uctab actab=actab fullinv=phl_cur -all now >> manutencao.txt
          mx phl_cur +control now >> manutencao.txt

echo 21 - Base de dados de fornecedores                               (phl_for)
echo ========================================================================== >> manutencao.txt
          mx phl_for +control now >> manutencao.txt
          retag phl_for unlock >> manutencao.txt
          mxcp phl_for create=xfor clean mintag=1 maxtag=9999 >> manutencao.txt
          mx xfor create=phl_for -all now >> manutencao.txt
          del xfor.* >> manutencao.txt
          mx phl_for fst=@ uctab=uctab actab=actab fullinv=phl_for -all now >> manutencao.txt
          mx phl_for +control now >> manutencao.txt

echo 22 - Base de dados do formulario de fornecedores             (phl_for_fmt)
echo ========================================================================== >> manutencao.txt
          mx phl_for_fmt +control now >> manutencao.txt
          retag phl_for_fmt unlock >> manutencao.txt
          mxcp phl_for_fmt create=xforfmt clean mintag=1 maxtag=9999 >> manutencao.txt
          mx xforfmt create=phl_for_fmt -all now >> manutencao.txt
          del xforfmt.* >> manutencao.txt
          mx phl_for_fmt fst=@ uctab=uctab actab=actab fullinv=phl_for_fmt -all now >> manutencao.txt
          mx phl_for_fmt +control now >> manutencao.txt

echo 23 - Base de dados de generos                                    (phl_gen)
echo ========================================================================== >> manutencao.txt
          mx phl_gen +control now >> manutencao.txt
          retag phl_gen unlock >> manutencao.txt
          mxcp phl_gen create=xgen clean mintag=1 maxtag=999 >> manutencao.txt
          mx xgen create=phl_gen -all now >> manutencao.txt
          del xgen.* >> manutencao.txt
          mx phl_gen fst=@ uctab=uctab actab=actab fullinv=phl_gen -all now >> manutencao.txt
          mx phl_gen +control now >> manutencao.txt

echo 24 - Base de dados de idiomas                                    (phl_idm)
echo ========================================================================== >> manutencao.txt
          mx phl_idm +control now >> manutencao.txt
          retag phl_idm unlock >> manutencao.txt
          mxcp phl_idm create=xidm clean mintag=1 maxtag=999 >> manutencao.txt
          mx xidm create=phl_idm -all now >> manutencao.txt
          del xidm.* >> manutencao.txt
          mx phl_idm fst=@ uctab=uctab actab=actab fullinv=phl_idm -all now >> manutencao.txt
          mx phl_idm +control now >> manutencao.txt

echo 25 - Base de dados de seguranca                                  (phl_log)
echo ========================================================================== >> manutencao.txt
          mx phl_log +control now >> manutencao.txt
          retag phl_log unlock >> manutencao.txt
          mx phl_log +control now >> manutencao.txt

echo 26 - Base de dados de areas do conhecimento                      (phl_mec)
echo ========================================================================== >> manutencao.txt
          mx phl_mec +control now >> manutencao.txt
          retag phl_mec unlock >> manutencao.txt
          mxcp phl_mec create=xmec clean mintag=1 maxtag=999 >> manutencao.txt
          mx xmec create=phl_mec -all now >> manutencao.txt
          del xmec.* >> manutencao.txt
          mx phl_mec fst=@ uctab=uctab actab=actab fullinv=phl_mec -all now >> manutencao.txt
          mx phl_mec +control now >> manutencao.txt

echo 27 - Base de dados arquivos                                      (phl_nda)
echo ========================================================================== >> manutencao.txt
          mx phl_nda +control now >> manutencao.txt
          retag phl_nda unlock >> manutencao.txt
          mxcp phl_nda create=xnda clean mintag=1 maxtag=999 >> manutencao.txt
          mx xnda create=phl_nda -all now >> manutencao.txt
          del xnda.* >> manutencao.txt
          mx phl_nda fst=@ uctab=uctab actab=actab fullinv=phl_nda -all now >> manutencao.txt
          mx phl_nda +control now >> manutencao.txt

echo 28 - Base de dados de penalidades                                (phl_pen)
echo ========================================================================== >> manutencao.txt
          mx phl_pen +control now >> manutencao.txt
          retag phl_pen unlock >> manutencao.txt
          mxcp phl_pen create=xpen clean mintag=1 maxtag=999 >> manutencao.txt
          del phl_pen.mst
          del phl_pen.xrf
          mx xpen append=phl_pen -all now >> manutencao.txt
          del xpen.* >> manutencao.txt
          mx phl_pen fst=@ uctab=uctab actab=actab fullinv=phl_pen -all now >> manutencao.txt
          mx phl_pen +control now >> manutencao.txt

echo 29 - Base de dados de periodicidade                              (phl_per)
echo ========================================================================== >> manutencao.txt
          mx phl_per +control now >> manutencao.txt
          retag phl_per unlock >> manutencao.txt
          mxcp phl_per create=xper clean mintag=1 maxtag=999 >> manutencao.txt
          mx xper create=phl_per -all now >> manutencao.txt
          del xper.* >> manutencao.txt
          mx phl_per fst=@ uctab=uctab actab=actab fullinv=phl_per -all now >> manutencao.txt
          mx phl_per +control now >> manutencao.txt

echo 30 - Base de dados de prazos e quantidades                       (phl_pqt)
echo ========================================================================== >> manutencao.txt
          mx phl_pqt +control now >> manutencao.txt
          retag phl_pqt unlock >> manutencao.txt
          mxcp phl_pqt create=xpqt clean mintag=1 maxtag=999 >> manutencao.txt
          mx xpqt create=phl_pqt -all now >> manutencao.txt
          del xpqt.* >> manutencao.txt
          mx phl_pqt fst=@ uctab=uctab actab=actab fullinv=phl_pqt -all now >> manutencao.txt
          mx phl_pqt +control now >> manutencao.txt

echo 31 - Base de dados de procedencia                                (phl_prc)
echo ========================================================================== >> manutencao.txt
          mx phl_prc +control now >> manutencao.txt
          retag phl_prc unlock >> manutencao.txt
          mxcp phl_prc create=xprc clean mintag=1 maxtag=999 >> manutencao.txt
          mx xprc create=phl_prc -all now >> manutencao.txt
          del xprc.* >> manutencao.txt
          mx phl_prc fst=@ uctab=uctab actab=actab fullinv=phl_prc -all now >> manutencao.txt
          mx phl_prc +control now >> manutencao.txt

echo 32 - Base de dados de senhas                                     (phl_pwd)
echo ========================================================================== >> manutencao.txt
          mx phl_pwd +control now >> manutencao.txt
          retag phl_pwd unlock >> manutencao.txt
          mxcp phl_pwd create=xpwd clean mintag=600 maxtag=999 >> manutencao.txt
          mx xpwd create=phl_pwd -all now >> manutencao.txt
          del xpwd.* >> manutencao.txt
          mx phl_pwd fst=@ uctab=uctab actab=actab fullinv=phl_pwd -all now >> manutencao.txt
          mx phl_pwd +control now >> manutencao.txt

echo 33 - Base de dados de relatorios personalizados                  (phl_rel)
echo ========================================================================== >> manutencao.txt
          mx phl_rel +control now >> manutencao.txt
          retag phl_rel unlock >> manutencao.txt
          mx phl_rel fst=@ uctab=uctab actab=actab fullinv=phl_rel -all now >> manutencao.txt
          mx phl_rel +control now >> manutencao.txt

echo 34 - Base de dados de reservas                                   (phl_res)
echo ========================================================================== >> manutencao.txt
          mx phl_res +control now >> manutencao.txt
          retag phl_res unlock >> manutencao.txt
          mxcp phl_res create=xres clean mintag=1 maxtag=999 >> manutencao.txt
          del phl_res.mst
          del phl_res.xrf
          mx xres append=phl_res -all now >> manutencao.txt
          del xres.* >> manutencao.txt
          mx phl_res fst=@ uctab=uctab actab=actab fullinv=phl_res -all now >> manutencao.txt
          mx phl_res +control now >> manutencao.txt

echo 35 - Base de dados de tipos de usuarios                          (phl_rgl)
echo ========================================================================== >> manutencao.txt
          mx phl_rgl +control now >> manutencao.txt
          retag phl_rgl unlock >> manutencao.txt
          mxcp phl_rgl create=xrgl clean mintag=1 maxtag=999 >> manutencao.txt
          mx xrgl create=phl_rgl -all now >> manutencao.txt
          del xrgl.* >> manutencao.txt
          mx phl_rgl fst=@ uctab=uctab actab=actab fullinv=phl_rgl -all now >> manutencao.txt
          mx phl_rgl +control now >> manutencao.txt

echo 36 - Base de dados de configuracao da biblioteca                 (phl_set)
echo ========================================================================== >> manutencao.txt
          mx phl_set +control now >> manutencao.txt
          retag phl_set unlock >> manutencao.txt
          mxcp phl_set create=xset clean mintag=1 maxtag=999 >> manutencao.txt
          mx xset create=phl_set -all now >> manutencao.txt
          del xset.* >> manutencao.txt
          mx phl_set fst=@ uctab=uctab actab=actab fullinv=phl_set -all now >> manutencao.txt
          mx phl_set +control now >> manutencao.txt

echo 37 - Base de dados de tipos de suporte                           (phl_spt)
echo ========================================================================== >> manutencao.txt
          mx phl_spt +control now >> manutencao.txt
          retag phl_spt unlock >> manutencao.txt
          mxcp phl_spt create=xspt clean mintag=1 maxtag=999 >> manutencao.txt
          mx xspt create=phl_spt -all now >> manutencao.txt
          del xspt.* >> manutencao.txt
          mx phl_spt fst=@ uctab=uctab actab=actab fullinv=phl_spt -all now >> manutencao.txt
          mx phl_spt +control now >> manutencao.txt

echo 38 - Base de dados de tipos de periodos                          (phl_tpr)
echo ========================================================================== >> manutencao.txt
          mx phl_tpr +control now >> manutencao.txt
          retag phl_tpr unlock >> manutencao.txt
          mxcp phl_tpr create=xtpr clean mintag=1 maxtag=999 >> manutencao.txt
          mx xtpr create=phl_tpr -all now >> manutencao.txt
          del xtpr.* >> manutencao.txt
          mx phl_tpr fst=@ uctab=uctab actab=actab fullinv=phl_tpr -all now >> manutencao.txt
          mx phl_tpr +control now >> manutencao.txt

echo 39 - Base de dados de usuarios                                   (phl_usr)
echo ========================================================================== >> manutencao.txt
          mx phl_usr +control now >> manutencao.txt
          retag phl_usr unlock >> manutencao.txt
          mxcp phl_usr create=xusr clean mintag=700 maxtag=999 >> manutencao.txt
          mx xusr create=phl_usr -all now >> manutencao.txt
          del xusr.* >> manutencao.txt
          mx phl_usr fst=@ uctab=uctab actab=actab fullinv=phl_usr -all now >> manutencao.txt
          mx phl_usr +control now >> manutencao.txt

echo 40 - Base de dados do formulario de usuarios                 (phl_usr_fmt)
echo ========================================================================== >> manutencao.txt
          mx phl_usr_fmt +control now >> manutencao.txt
          retag phl_usr_fmt unlock >> manutencao.txt
          mxcp phl_usr_fmt create=xusrfmt clean mintag=1 maxtag=9999 >> manutencao.txt
          mx xusrfmt create=phl_usr_fmt -all now >> manutencao.txt
          del xusrfmt.* >> manutencao.txt
          mx phl_usr_fmt fst=@ uctab=uctab actab=actab fullinv=phl_usr_fmt -all now >> manutencao.txt
          mx phl_usr_fmt +control now >> manutencao.txt

echo 41 - Base de dados de vocabulario                                (phl_voc)
echo ========================================================================== >> manutencao.txt
          mx phl_voc +control now >> manutencao.txt
          retag phl_voc unlock >> manutencao.txt
          mxcp phl_voc create=xvoc clean mintag=1 maxtag=999 >> manutencao.txt
          mx xvoc create=phl_voc -all now >> manutencao.txt
          del xvoc.* >> manutencao.txt
          mx phl_voc fst=@ uctab=uctab actab=actab fullinv=phl_voc -all now >> manutencao.txt
          mx phl_voc +control now >> manutencao.txt
          
echo 42 - Base de dados de erros                                      (phl_err)
echo ========================================================================== >> manutencao.txt
          mx phl_err +control now >> manutencao.txt
          retag phl_err unlock >> manutencao.txt

echo 43 - Base de dados de acesso                                     (phl_idx)
echo ========================================================================== >> manutencao.txt
          mx null count=0 create=phl_idx -all now >> manutencao.txt

echo ==========================================================================
          mx phl_cnf copy=phl_cnf "proc='d201d202','a201#N#'" -all now
          mx phl_cnf fst=@ uctab=uctab actab=actab fullinv=phl_cnf -all now
echo FIM: - %date% - %time%
echo ==========================================================================
echo FIM: - %date% - %time% >> manutencao.txt