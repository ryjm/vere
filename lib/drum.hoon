::                                                      ::  ::
::::  /hoon/drum/lib                                    ::  ::
  ::                                                    ::  ::
/?    310                                               ::  version
/-    sole
/+    sole
[. ^sole]
!:                                                      ::  ::
::::                                                    ::  ::
  ::                                                    ::  ::
|%                                                      ::  ::
++  drum-part  {$drum $1 drum-pith-1}                   ::
++  drum-part-old  {$drum $0 drum-pith-0}               ::
++  drum-pith-0  _!!                                    ::  forgotten
++  drum-pith-1                                         ::
  $:  sys/(unit bone)                                   ::  local console
      eel/(set gill:^gall)                              ::  connect to
      ray/(set well:^gall)                              ::
      fur/(map dude:^gall (unit server))                ::  servers
      bin/(map bone source)                             ::  terminals
  ==                                                    ::
::                                                      ::  ::
::::                                                    ::  ::
  ::                                                    ::  ::
++  server                                              ::  running server
  $:  syd/desk                                          ::  app identity
      cas/case                                          ::  boot case
  ==                                                    ::
++  kill                                                ::  kill ring
  $:  pos/@ud                                           ::  ring position
      num/@ud                                           ::  number of entries
      max/_60                                           ::  max entries
      old/(list (list @c))                              ::  entries proper
  ==                                                    ::
++  source                                              ::  input device
  $:  edg/_80                                           ::  terminal columns
      off/@ud                                           ::  window offset
      kil/kill                                          ::  kill buffer
      inx/@ud                                           ::  ring index
      fug/(map gill:^gall (unit target))                      ::  connections
      mir/(pair @ud (list @c))                          ::  mirrored terminal
  ==                                                    ::
++  history                                             ::  past input
  $:  pos/@ud                                           ::  input position
      num/@ud                                           ::  number of entries
      lay/(map @ud (list @c))                           ::  editing overlay
      old/(list (list @c))                              ::  entries proper
  ==                                                    ::
++  search                                              ::  reverse-i-search
  $:  pos/@ud                                           ::  search position
      str/(list @c)                                     ::  search string
  ==                                                    ::
++  target                                              ::  application target
  $:  $=  blt                                           ::  curr & prev belts
        %+  pair       
          (unit dill-belt:^dill) 
        (unit dill-belt:^dill)
      ris/(unit search)                                 ::  reverse-i-search
      hit/history                                       ::  all past input
      pom/sole-prompt                                   ::  static prompt
      inp/sole-command                                  ::  input state
  ==                                                    ::
--
::                                                      ::  ::
::::                                                    ::  ::
  ::                                                    ::  ::
|%
++  deft-apes                                           ::  default servers
  |=  our/ship
  %-  ~(gas in *(set well:^gall))
  ^-  (list well:^gall)
  =+  myr=(clan:title:jael our)
  ?:  ?=($pawn myr)
    [[%base %talk] [%base %dojo] ~]
  ?:  ?=($earl myr)
    [[%home %dojo] ~]
  [[%home %talk] [%home %dojo] ~]
::
++  deft-fish                                           ::  default connects
  |=  our/ship
  %-  ~(gas in *(set gill:^gall))
  ^-  (list gill:^gall)
  ?:  ?=($earl (clan:title:jael our))
    [[(sein:title:jael our) %talk] [our %dojo] ~]
  [[our %talk] [our %dojo] ~]
::
++  drum-make                                           ::  initial part
  |=  our/ship
  ^-  drum-part
  :*  %drum
      %1
      ~                                                 ::  sys
      (deft-fish our)                                   ::  eel
      (deft-apes our)                                   ::  ray
      ~                                                 ::  fur
      ~                                                 ::  bin
  ==                                                    ::
++  drum-port
  |=  old/?(drum-part drum-part-old)  ^-  drum-part
  ?-  &2.old
    $1  old
    $0  !!  :: XX unreachable, see issue #242
  ==
::
++  drum-path                                           ::  encode path
  |=  gyl/gill:^gall  
  ^-  wire
  [%drum %phat (scot %p p.gyl) q.gyl ~]
::
++  drum-phat                                           ::  decode path
  |=  way/wire  ^-  gill:^gall
  ?>(?=({@ @ $~} way) [(slav %p i.way) i.t.way])
--
!:
::::
  ::
|=  {bowl:^gall drum-part}                              ::  main drum work
=+  (fall (~(get by bin) ost) *source)
=*  dev  -
=>  |%                                                ::  arvo structures
    ++  pear                                          ::  request
      $%  {$sole-action p/sole-action}                ::
          {$talk-command command:talk}                ::
      ==                                              ::
    ++  lime                                          ::  update
      $%  {$dill-blit dill-blit:^dill}                ::
      ==                                              ::
    ++  card                                          ::  general card
      $%  {$conf wire dock $load ship term}           ::
          {$diff lime}                                ::
          {$peer wire dock path}                      ::
          {$poke wire dock pear}                      ::
          {$pull wire dock $~}                        ::
      ==                                              ::
    ++  move  (pair bone card)                        ::  user-level move
    --
|_  {moz/(list move) biz/(list dill-blit:^dill)}
++  diff-sole-effect-phat                             ::
  |=  {way/wire fec/sole-effect}
  =<  se-abet  =<  se-view
  =+  gyl=(drum-phat way)
  ?:  (se-aint gyl)  +>.$
  (se-diff gyl fec)
::
++  peer                                              ::
  |=  pax/path
  ~|  [%drum-unauthorized our+our src+src]            ::  ourself
  ?>  (team:title:jael our src)                       ::  or our own moon
  =<  se-abet  =<  se-view
  (se-text "[{<src>}, driving {<our>}]")
::
++  poke-dill-belt                                    ::
  |=  bet/dill-belt:^dill
  =<  se-abet  =<  se-view
  (se-belt bet)
::
++  poke-start                                        ::
  |=  wel/well:^gall
  =<  se-abet  =<  se-view
  (se-born wel)
::
++  poke-link                                         ::
  |=  gyl/gill:^gall
  =<  se-abet  =<  se-view
  (se-link gyl)
::
++  poke-unlink                                       ::
  |=  gyl/gill:^gall
  =<  se-abet  =<  se-view
  (se-klin gyl)
::
++  poke-exit                                         ::
  |=  $~ 
  se-abet:(se-blit-sys `dill-blit:^dill`[%qit ~])
::
++  poke-put                                          ::
  |=  {pax/path txt/@}
  se-abet:(se-blit-sys [%sav pax txt])                ::
::
++  reap-phat                                         ::
  |=  {way/wire saw/(unit tang)}
  =<  se-abet  =<  se-view
  =+  gyl=(drum-phat way)
  ?~  saw
    (se-join gyl)
  (se-dump:(se-drop & gyl) u.saw)
::
++  take-coup-phat                                    ::
  |=  {way/wire saw/(unit tang)}
  =<  se-abet  =<  se-view
  ?~  saw  +>
  =+  gyl=(drum-phat way)
  ?:  (se-aint gyl)  +>.$
  %-  se-dump:(se-drop & gyl)
  :_  u.saw
  >[%drum-coup-fail src ost gyl]<
::
++  take-onto                                         ::
  |=  {way/wire saw/(each suss:^gall tang)}
  =<  se-abet  =<  se-view
  ?>  ?=({@ @ $~} way)
  ?>  (~(has by fur) i.t.way)
  =/  wel/well:^gall  [i.way i.t.way]
  ?-  saw
    {$| *}  (se-dump p.saw)
    {$& *}  ?>  =(q.wel p.p.saw)
            ::  =.  +>.$  (se-text "live {<p.saw>}")
            +>.$(fur (~(put by fur) q.wel `[p.wel %da r.p.saw]))
  ==
::
++  quit-phat                                         ::
  |=  way/wire
  =<  se-abet  =<  se-view
  =+  gyl=(drum-phat way)
  ~&  [%drum-quit src ost gyl]
  (se-drop %| gyl)
::                                                    ::  ::
::::                                                  ::  ::
  ::                                                  ::  ::
++  se-abet                                           ::  resolve
  ^-  (quip move *drum-part)
  =*  pith  +>+>+<+
  ?.  se-ably
    =.  .  se-adit
    [(flop moz) pith]
  =.  sys  ?^(sys sys `ost)
  =.  .  se-subze:se-adze:se-adit
  :_  pith(bin (~(put by bin) ost dev))
  %-  flop
  ^-  (list move)
  ?~  biz  moz
  :_  moz
  [ost %diff %dill-blit ?~(t.biz i.biz [%mor (flop biz)])]
::
++  se-ably  (~(has by sup) ost)                      ::  caused by console
++  se-adit                                           ::  update servers
  ^+  .
  %+  roll  (~(tap in ray))
  =<  .(con +>)
  |=  {wel/well:^gall con/_..se-adit}  ^+  con
  =.  +>.$  con
  =+  hig=(~(get by fur) q.wel)
  ?:  &(?=(^ hig) |(?=($~ u.hig) =(p.wel syd.u.u.hig)))  +>.$
  =.  +>.$  (se-text "activated app {(trip p.wel)}/{(trip q.wel)}")
  %-  se-emit(fur (~(put by fur) q.wel ~))
  [ost %conf [%drum p.wel q.wel ~] [our q.wel] %load our p.wel]
::
++  se-adze                                           ::  update connections
  ^+  .
  %+  roll  (~(tap in eel))
  =<  .(con +>)
  |=  {gil/gill:^gall con/_.}  ^+  con
  =.  +>.$  con
  ?:  (~(has by fug) gil)
    +>.$
  (se-peer gil)
::
++  se-subze                                          ::  downdate connections
  =<  .(dev (~(got by bin) ost))
  =.  bin  (~(put by bin) ost dev)
  ^+  .
  %-  ~(rep by bin)
  =<  .(con +>)
  |=  {{ost/bone dev/source} con/_.}  ^+  con
  =+  xeno=se-subze-local:%_(con ost ost, dev dev)
  xeno(ost ost.con, dev dev.con, bin (~(put by bin) ost dev.xeno))
::
++  se-subze-local
  ^+  .
  %-  ~(rep by fug)
  =<  .(con +>)
  |=  {{gil/gill:^gall *} con/_.}  ^+  con
  =.  +>.$  con
  ?:  (~(has in eel) gil)
    +>.$
  (se-nuke gil)
::
++  se-aint                                           ::  ignore result
  |=  gyl/gill:^gall
  ^-  ?
  ?.  (~(has by bin) ost)  &
  =+  gyr=(~(get by fug) gyl)
  |(?=($~ gyr) ?=($~ u.gyr))
::
++  se-alas                                           ::  recalculate index
  |=  gyl/gill:^gall
  =+  [xin=0 wag=se-amor]
  |-  ^+  +>.^$
  ?~  wag  +>.^$(inx 0)
  ?:  =(i.wag gyl)  +>.^$(inx xin)
  $(wag t.wag, xin +(xin))
::
++  se-amor                                           ::  live targets
  ^-  (list gill:^gall)
  %+  skim  (~(tap in eel))
  |=(a/gill:^gall ?=({$~ $~ *} (~(get by fug) a)))
::
++  se-anon                                           ::  rotate index
  =+  wag=se-amor
  ?~  wag  +
  ::  ~&  [%se-anon inx+inx wag+wag nex+(mod +(inx) (lent se-amor))]
  +(inx (mod +(inx) (lent wag)))
::
++  se-agon                                           ::  current gill
  ^-  (unit gill:^gall)
  =+  wag=se-amor
  ?~  wag  ~
  `(snag inx `(list gill:^gall)`wag)
::
++  se-belt                                           ::  handle input
  |=  bet/dill-belt:^dill
  ^+  +>
  ?:  ?=({?($hey $rez $yow) *} bet)                   ::  target-agnostic
    ?-  bet
      {$hey *}  +>(mir [0 ~])                         ::  refresh
      {$rez *}  +>(edg (dec p.bet))                   ::  resize window
      {$yow *}  ~&([%no-yow -.bet] +>)
    ==
  =+  gul=se-agon
  ?:  |(?=($~ gul) (se-aint u.gul))
    (se-blit %bel ~)
  ta-abet:(ta-belt:(se-tame u.gul) bet)
::
++  se-born                                           ::  new server
  |=  wel/well:^gall
  ^+  +>
  ?:  (~(has in ray) wel)
    (se-text "[already running {<p.wel>}/{<q.wel>}]")
  %=  +>
    ray  (~(put in ray) wel)
    eel  (~(put in eel) [our q.wel])
  ==
::
++  se-drop                                           ::  disconnect
  |=  {pej/? gyl/gill:^gall}
  ^+  +>
  =+  lag=se-agon
  ?.  (~(has by fug) gyl)  +>.$
  =.  fug  (~(del by fug) gyl)
  =.  eel  ?.(pej eel (~(del in eel) gyl))
  =.  +>.$  ?.  &(?=(^ lag) !=(gyl u.lag))
              +>.$(inx 0)
            (se-alas u.lag)
  =.  +>.$  (se-text "[unlinked from {<gyl>}]")
  ?:  =(gyl [our %dojo])                              ::  undead dojo
    (se-link gyl)
  +>.$
::
++  se-dump                                           ::  print tanks
  |=  tac/(list tank)
  ^+  +>
  ?.  se-ably  (se-talk tac)
  =+  wol=`wall`(zing (turn (flop tac) |=(a/tank (~(win re a) [0 edg]))))
  |-  ^+  +>.^$
  ?~  wol  +>.^$
  $(wol t.wol, +>.^$ (se-blit %out (tuba i.wol)))
::
++  se-join                                           ::  confirm connection
  |=  gyl/gill:^gall
  ^+  +>
  =.  +>  (se-text "[linked to {<gyl>}]")
  ?>  ?=($~ (~(got by fug) gyl))
  (se-alas(fug (~(put by fug) gyl `*target)) gyl)
::
++  se-nuke                                           ::  teardown
  |=  gyl/gill:^gall
  ^+  +>
  (se-drop:(se-pull gyl) & gyl)
::
++  se-klin                                           ::  disconnect app
  |=  gyl/gill:^gall
  +>(eel (~(del in eel) gyl))
::
++  se-link                                           ::  connect to app
  |=  gyl/gill:^gall
  +>(eel (~(put in eel) gyl))
::
++  se-blit                                           ::  give output
  |=  bil/dill-blit:^dill
  +>(biz [bil biz])
::
++  se-blit-sys                                       ::  output to system 
  |=  bil/dill-blit:^dill  ^+  +>
  ?~  sys  ~&(%se-blit-no-sys +>)
  (se-emit [u.sys %diff %dill-blit bil])
::
++  se-show                                           ::  show buffer, raw
  |=  lin/(pair @ud (list @c))
  ^+  +>
  ?:  =(mir lin)  +>
  =.  +>  ?:(=(q.mir q.lin) +> (se-blit %pro q.lin))
  =.  +>  ?:(=(p.mir p.lin) +> (se-blit %hop p.lin))
  +>(mir lin)
::
++  se-just                                           ::  adjusted buffer
  |=  lin/(pair @ud (list @c))
  ^+  +>
  =.  off  ?:((lth p.lin edg) 0 (sub p.lin edg))
  (se-show (sub p.lin off) (scag edg (slag off q.lin)))
::
++  se-view                                           ::  flush buffer
  ^+  .
  =+  gul=se-agon
  ?:  |(?=($~ gul) (se-aint u.gul))  +
  (se-just ta-vew:(se-tame u.gul))
::
++  se-emit                                           ::  emit move
  |=  mov/move
  %_(+> moz [mov moz])
::
++  se-talk
  |=  tac/(list tank)
  ^+  +>
  :: XX talk should be usable for stack traces, see urbit#584 which this change
  :: closed for the problems there
  ((slog (flop tac)) +>)
  ::(se-emit 0 %poke /drum/talk [our %talk] (said:talk our %drum now eny tac))
::
++  se-text                                           ::  return text
  |=  txt/tape
  ^+  +>
  ?.  se-ably  (se-talk [%leaf txt]~)
  (se-blit %out (tuba txt))
::
++  se-poke                                           ::  send a poke
  |=  {gyl/gill:^gall par/pear}
  (se-emit [ost %poke (drum-path gyl) gyl par])
::
++  se-peer                                           ::  send a peer
  |=  gyl/gill:^gall
  %-  se-emit(fug (~(put by fug) gyl ~))
  [ost %peer (drum-path gyl) gyl /sole]
::
++  se-pull                                           ::  cancel subscription
  |=  gyl/gill:^gall
  (se-emit [ost %pull (drum-path gyl) gyl ~])
::
++  se-tame                                           ::  switch connection
  |=  gyl/gill:^gall
  ^+  ta
  ~(. ta [& gyl] (need (~(got by fug) gyl)))
::
++  se-diff                                           ::  receive results
  |=  {gyl/gill:^gall fec/sole-effect}
  ^+  +>
  ta-abet:(ta-fec:(se-tame gyl) fec)
::
++  ta                                                ::  per target
  |_  $:  $:  liv/?                                   ::  don't delete
              gyl/gill:^gall                          ::  target app
          ==                                          ::
          target                                      ::  target state
      ==                                              ::
  ++  ta-abet                                         ::  resolve
    ^+  ..ta
    ?.  liv
      ?:   (~(has in (deft-fish our)) gyl)
        (se-blit qit+~)
      (se-nuke gyl)
    ..ta(fug (~(put by fug) gyl ``target`+<+))
  ::
  ++  ta-poke  |=(a/pear +>(..ta (se-poke gyl a)))    ::  poke gyl
  ::
  ++  ta-act                                          ::  send action
    |=  act/sole-action
    ^+  +>
    (ta-poke %sole-action act)
  ::
  ++  ta-aro                                          ::  hear arrow
    |=  key/?($d $l $r $u)
    ^+  +>
    ?-  key
      $d  =.  ris  ~
          ?.  =(num.hit pos.hit)
            (ta-mov +(pos.hit))
          ?:  =(0 (lent buf.say.inp))
            ta-bel
          (ta-hom:ta-nex %set ~)
      $l  ?:  =(0 pos.inp)  ta-bel
          +>(pos.inp (dec pos.inp), ris ~)
      $r  ?:  =((lent buf.say.inp) pos.inp)
            ta-bel
          +>(pos.inp +(pos.inp), ris ~)
      $u  =.  ris  ~
          ?:(=(0 pos.hit) ta-bel (ta-mov (dec pos.hit)))
    ==
  ::
  ++  ta-bel                                          ::  beep
    .(+> (se-blit %bel ~), q.blt ~)                   ::  forget belt
  ::
  ++  ta-belt                                         ::  handle input
    |=  bet/dill-belt:^dill
    ^+  +>
    ?<  ?=({?($hey $rez $yow) *} bet)                 ::  target-specific
    =.  blt  [q.blt `bet]                             ::  remember belt
    ?-  bet
      {$aro *}  (ta-aro p.bet)
      {$bac *}  ta-bac
      {$cru *}  (ta-cru p.bet q.bet)
      {$ctl *}  (ta-ctl p.bet)
      {$del *}  ta-del
      {$met *}  (ta-met p.bet)
      {$ret *}  ta-ret
      {$txt *}  (ta-txt p.bet)
    ==
  ::
  ++  ta-det                                          ::  send edit
    |=  ted/sole-edit
    ^+  +>
    (ta-act %det [[his.ven.say.inp own.ven.say.inp] (sham buf.say.inp) ted])
  ::
  ++  ta-bac                                          ::  hear backspace
    ^+  .
    ?^  ris
      ?:  =(~ str.u.ris)
        ta-bel
      .(str.u.ris (scag (dec (lent str.u.ris)) str.u.ris))
    ?:  =(0 pos.inp)
      (ta-act %clr ~)
      :: .(+> (se-blit %bel ~))
    =+  pre=(dec pos.inp)
    (ta-hom %del pre)
  ::
  ++  ta-ctl                                          ::  hear control
    |=  key/@ud
    ^+  +>
    ?+    key  ta-bel
        $a  +>(pos.inp 0, ris ~)
        $b  (ta-aro %l)
        $c  ta-bel(ris ~)
        $d  ?:  &(=(0 pos.inp) =(0 (lent buf.say.inp)))
              +>(liv |)
            ta-del
        $e  +>(pos.inp (lent buf.say.inp))
        $f  (ta-aro %r)
        $g  ?~  ris  ta-bel
            (ta-hom(pos.hit num.hit, ris ~) [%set ~])
        $k  =+  len=(lent buf.say.inp)
            ?:  =(pos.inp len)
              ta-bel
            %-  (ta-kil %r (slag pos.inp buf.say.inp))
            (cut:edit pos.inp (sub len pos.inp))
        $l  +>(+> (se-blit %clr ~))
        $n  (ta-aro %d)
        $p  (ta-aro %u)
        $r  ?~  ris
              +>(ris `[pos.hit ~])
            ?:  =(0 pos.u.ris)
              ta-bel
            (ta-ser ~)
        $t  =+  len=(lent buf.say.inp)
            ?:  |(=(0 pos.inp) (lth len 2))
              ta-bel
            =+  sop=(sub pos.inp ?:(=(len pos.inp) 2 1))
            %-  ta-hom(ris ~)
            (rep:edit [sop 2] (flop (swag [sop 2] buf.say.inp)))
        $u  ?:  =(0 pos.inp)
              ta-bel
            %-  (ta-kil %l (scag pos.inp buf.say.inp))
            (cut:edit 0 pos.inp)
        $v  ta-bel
        $w  ?:  =(0 pos.inp)
              ta-bel
            =+  b=(bwrd pos.inp buf.say.inp nace)
            %-  (ta-kil %l (slag b (scag pos.inp buf.say.inp)))
            (cut:edit b (sub pos.inp b))
        $x  +>(+> se-anon)
        $y  ?:  =(0 num.kil)
              ta-bel
            %-  ta-hom(ris ~)
            (cat:edit pos.inp (snag (sub num.kil pos.kil) old.kil))
    ==
  ::
  ++  ta-cru                                          ::  hear crud
    |=  {lab/@tas tac/(list tank)}
    =.  +>+>  (se-text (trip lab))
    (ta-tan tac)
  ::
  ++  ta-del                                          ::  hear delete
    ^+  .
    ?:  =((lent buf.say.inp) pos.inp)
      .(+> (se-blit %bel ~))
    (ta-hom %del pos.inp)
  ::
  ++  ta-erl                                          ::  hear local error
    |=  pos/@ud
    ta-bel(pos.inp (min pos (lent buf.say.inp)))
  ::
  ++  ta-err                                          ::  hear remote error
    |=  pos/@ud
    (ta-erl (~(transpose sole say.inp) pos))
  ::
  ++  ta-fec                                          ::  apply effect
    |=  fec/sole-effect
    ^+  +>
    ?-  fec
      {$bel *}  ta-bel
      {$blk *}  +>
      {$clr *}  +>(+> (se-blit fec))
      {$det *}  (ta-got +.fec)
      {$err *}  (ta-err p.fec)
      {$mor *}  |-  ^+  +>.^$
                ?~  p.fec  +>.^$
                $(p.fec t.p.fec, +>.^$ ^$(fec i.p.fec))
      {$nex *}  ta-nex
      {$pro *}  (ta-pro +.fec)
      {$tan *}  (ta-tan p.fec)
      {$sag *}  +>(+> (se-blit fec))
      {$sav *}  +>(+> (se-blit fec))
      {$txt *}  (ta-tan [[%leaf p.fec] ~])
      {$url *}  +>(+> (se-blit fec))
    ==
  ::
  ++  ta-dog                                          ::  change cursor
    |=  ted/sole-edit
    %_    +>
        pos.inp
      =+  len=(lent buf.say.inp)
      %+  min  len
      |-  ^-  @ud
      ?-  ted
        {$del *}  ?:((gth pos.inp p.ted) (dec pos.inp) pos.inp)
        {$ins *}  ?:((gte pos.inp p.ted) +(pos.inp) pos.inp)
        {$mor *}  |-  ^-  @ud
                  ?~  p.ted  pos.inp
                  $(p.ted t.p.ted, pos.inp ^$(ted i.p.ted))
        {$nop *}  pos.inp
        {$set *}  len
      ==
    ==
  ::
  ++  ta-got                                          ::  apply change
    |=  cal/sole-change
    =^  ted  say.inp  (~(receive sole say.inp) cal)
    (ta-dog ted)
  ::
  ++  ta-hom                                          ::  local edit
    |=  ted/sole-edit
    ^+  +>
    =.  +>  (ta-det ted)
    =.  +>  (ta-dog(say.inp (~(commit sole say.inp) ted)) ted)
    +>
  ::
  ++  ta-kil                                          ::  update kill ring
    |=  {a/?($l $r) b/(list @c)}
    ^+  ta-hom
    =;  lik/(pair @ud (list (list @c)))
      %=  ta-hom
        ris  ~
        kil  %=  kil
               num  p.lik
               pos  p.lik
               old  (scag max.kil q.lik)
      ==     ==
    ?.  ?&  ?=(^ old.kil)
            ?=(^ p.blt)
            ?|  ?=({$ctl ?($k $u $w)} u.p.blt)
                ?=({$met ?($d $bac)} u.p.blt)
        ==  ==
      [+(num.kil) b old.kil]
    :+  num.kil
    ?-  a
      $l  (welp b i.old.kil)
      $r  (welp i.old.kil b)
    ==
    t.old.kil
  ::
  ++  lcas                                            ::  lowercase
    |*  a/(list @)
    ^+  a
    %+  turn  a
    |=(a/@ ?.(&((gte a 'A') (lte a 'Z')) a (add 32 a)))
  ::
  ++  ucas                                            ::  uppercase
    |*  a/(list @)
    ^+  a
    %+  turn  a
    |=(a/@ ?.(&((gte a 'a') (lte a 'z')) a (sub a 32)))
  ::
  ++  alnm                                            ::  alpha-numeric
    |=  a/@  ^-  ?
    ?|  &((gte a '0') (lte a '9'))
        &((gte a 'A') (lte a 'Z'))
        &((gte a 'a') (lte a 'z'))
    ==
  ::
  ++  nace                                            ::  next ace offset
    |=  a/(list @)
    =|  i/@ud
    =+  b=|
    |-  ^+  i
    ?~  a  i
    =+  c=.=(32 i.a)
    =.  b  |(b c)
    ?:  &(b !|(=(0 i) c))
      i
    $(i +(i), a t.a)
  ::
  ++  nedg                                            ::  next boundary offset
    |=  a/(list @)
    =|  i/@ud
    =+  b=|
    |-  ^+  i
    ?~  a  i
    =+  c=(alnm i.a)
    =.  b  |(b c)
    ?:  &(b !|(=(0 i) c))
      i
    $(i +(i), a t.a)
  ::
  ++  nwrd                                            ::  word-offset
    |=  a/(list @)
    =|  i/@ud
    |-  ^+  i
    ?:  |(?=($~ a) (alnm i.a))
      i
    $(i +(i), a t.a)
  ::
  ++  bwrd                                            :: prev pos by offset
    |=  {a/@ud b/(list @) c/$-((list @) @)}
    ^-  @ud
    (sub a (c (flop (scag a b))))
  ::
  ++  fwrd                                            :: next pos by offset
    |=  {a/@ud b/(list @) c/$-((list @) @)}
    ^-  @ud
    (add a (c (slag a b)))
  ::
  ++  ta-met                                          ::  meta key
    |=  key/@ud
    ?+    key    ta-bel
      $dot  ?.  &(?=(^ old.hit) ?=(^ i.old.hit))
              ta-bel
            =+  old=`(list @c)`i.old.hit
            =+  b=(bwrd (lent old) old nedg)
            %-  ta-hom(ris ~)
            (cat:edit pos.inp (slag b old))
            ::
      $bac  ?:  =(0 pos.inp)
              ta-bel
            =+  b=(bwrd pos.inp buf.say.inp nedg)
            %-  (ta-kil %l (slag b (scag pos.inp buf.say.inp)))
            (cut:edit b (sub pos.inp b))
            ::
      $b    ?:  =(0 pos.inp)
              ta-bel
            +>(pos.inp (bwrd pos.inp buf.say.inp nedg))
            ::
      $c    ?:  =(pos.inp (lent buf.say.inp))
              ta-bel
            =+  sop=(fwrd pos.inp buf.say.inp nwrd)
            %-  ta-hom(pos.inp (fwrd sop buf.say.inp nedg))
            (rep:edit [sop 1] (ucas (swag [sop 1] buf.say.inp)))
            ::
      $d    ?:  =(pos.inp (lent buf.say.inp))
              ta-bel
            =+  f=(fwrd pos.inp buf.say.inp nedg)
            %-  (ta-kil %r (slag pos.inp (scag f buf.say.inp)))
            (cut:edit pos.inp (sub f pos.inp))
            ::
      $f    ?:  =(pos.inp (lent buf.say.inp))
              ta-bel
            +>(pos.inp (fwrd pos.inp buf.say.inp nedg))
            ::
      $r    %-  ta-hom(lay.hit (~(put by lay.hit) pos.hit ~))
            :-  %set
            ?:  =(pos.hit num.hit)  ~
            (snag (sub num.hit +(pos.hit)) old.hit)
            ::
      $t    =+  a=(fwrd pos.inp buf.say.inp nedg)
            =+  b=(bwrd a buf.say.inp nedg)
            =+  c=(bwrd b buf.say.inp nedg)
            ?:  =(b c)
              ta-bel
            =/  prev/(pair @ud @ud)  [c (sub (fwrd c buf.say.inp nedg) c)]
            =/  next/(pair @ud @ud)  [b (sub a b)]
            %-  ta-hom(pos.inp a)
            :~  %mor
                (rep:edit next (swag prev buf.say.inp))
                (rep:edit prev (swag next buf.say.inp))
            ==
            ::
      ?($u $l)
            ?:  =(pos.inp (lent buf.say.inp))
              ta-bel
            =+  case=?:(?=($u key) ucas lcas)
            =+  sop=(fwrd pos.inp buf.say.inp nwrd)
            =+  f=(fwrd sop buf.say.inp nedg)
            %-  ta-hom
            %+  rep:edit
              [sop (sub f pos.inp)]
            (case (slag sop (scag f buf.say.inp)))
            ::
      $y    ?.  ?&  (gth num.kil 0)
                    ?=(^ p.blt)
                    ?|  ?=({$ctl $y} u.p.blt)
                        ?=({$met $y} u.p.blt)
                ==  ==
              ta-bel
            =+  las=(lent (snag (sub num.kil pos.kil) old.kil))
            =+  pos=?:(=(1 pos.kil) num.kil (dec pos.kil))
            %-  ta-hom(pos.kil pos, ris ~)
            %+  rep:edit
              [(sub pos.inp las) las]
            (snag (sub num.kil pos) old.kil)
    ==
  ::
  ++  ta-mov                                          ::  move in history
    |=  sop/@ud
    ^+  +>
    ?:  =(sop pos.hit)  +>
    %+  %=  ta-hom
          pos.hit  sop
          lay.hit  %+  ~(put by lay.hit)
                     pos.hit
                   buf.say.inp
        ==
      %set
    %-  (bond |.((snag (sub num.hit +(sop)) old.hit)))
    (~(get by lay.hit) sop)
  ::
  ++  ta-nex                                          ::  advance history
    ?:  ?|  ?=($~ buf.say.inp)
            &(?=(^ old.hit) =(buf.say.inp i.old.hit))
        ==
      %_(. pos.hit num.hit, ris ~, lay.hit ~)
    %_  .
      num.hit  +(num.hit)
      pos.hit  +(num.hit)
      ris  ~
      lay.hit  ~
      old.hit  [buf.say.inp old.hit]
    ==
  ::
  ++  ta-pro                                          ::  set prompt
    |=  pom/sole-prompt
    +>(pom pom(cad :(welp (scow %p p.gyl) ":" (trip q.gyl) cad.pom)))
  ::
  ++  ta-ret                                          ::  hear return
    (ta-act %ret ~)
  ::
  ++  ta-ser                                          ::  reverse search
    |=  ext/(list @c)
    ^+  +>
    ?:  |(?=($~ ris) =(0 pos.u.ris))  ta-bel
    =+  sop=?~(ext (dec pos.u.ris) pos.u.ris)
    =+  tot=(weld str.u.ris ext)
    =+  dol=(slag (sub num.hit sop) old.hit)
    =+  ^=  ser
        =+  ^=  beg
            |=  {a/(list @c) b/(list @c)}  ^-  ?
            ?~(a & ?~(b | &(=(i.a i.b) $(a t.a, b t.b))))
        |=  {a/(list @c) b/(list @c)}  ^-  ?
        ?~(a & ?~(b | |((beg a b) $(b t.b))))
    =+  ^=  sup
        |-  ^-  (unit @ud)
        ?~  dol  ~
        ?:  (ser tot i.dol)
          `sop
        $(sop (dec sop), dol t.dol)
    ?~  sup  ta-bel
    (ta-mov(str.u.ris tot, pos.u.ris u.sup) (dec u.sup))
  ::
  ++  ta-tan                                          ::  print tanks
    |=  tac/(list tank)
    =+  wol=`wall`(zing (turn (flop tac) |=(a/tank (~(win re a) [0 edg]))))
    |-  ^+  +>.^$
    ?~  wol  +>.^$
    $(wol t.wol, +>+>.^$ (se-text i.wol))
  ::
  ++  ta-txt                                          ::  hear text
    |=  txt/(list @c)
    ^+  +>
    ?^  ris
      (ta-ser txt)
    (ta-hom (cat:edit pos.inp txt))
  ::
  ++  ta-vew                                          ::  computed prompt
    |-  ^-  (pair @ud (list @c))
    ?^  ris
      %=    $
          ris  ~
          cad.pom
        :(welp "(reverse-i-search)'" (tufa str.u.ris) "': ")
      ==
    =-  [(add pos.inp (lent p.vew)) (weld (tuba p.vew) q.vew)]
    ^=  vew  ^-  (pair tape (list @c))
    ?:  vis.pom  [cad.pom buf.say.inp]
    :-  ;:  welp
          cad.pom
          ?~  buf.say.inp  ~
          ;:  welp
            "<"
            (scow %p (end 4 1 (sham buf.say.inp)))
            "> "
          ==
        ==
    =+  len=(lent buf.say.inp)
    |-  ^-  (list @c)
    ?:(=(0 len) ~ [`@c`'*' $(len (dec len))])
  --
++  edit                                              ::  produce sole-edits
  |%
  ++  cat                                             ::  mass insert
    |=  {pos/@ud txt/(list @c)}
    ^-  sole-edit
    :-  %mor
    |-  ^-  (list sole-edit)
    ?~  txt  ~
    [[%ins pos i.txt] $(pos +(pos), txt t.txt)]
  ::
  ++  cut                                             ::  mass delete
    |=  {pos/@ud num/@ud}
    ^-  sole-edit
    :-  %mor
    |-  ^-  (list sole-edit)
    ?:  =(0 num)  ~
    [[%del pos] $(num (dec num))]
  ::
  ++  rep                                             ::  mass replace
    |=  {{pos/@ud num/@ud} txt/(list @c)}
    ^-  sole-edit
    :~  %mor
        (cut pos num)
        (cat pos txt)
    ==
  --
--
