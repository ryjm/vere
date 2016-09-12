::    %jael, secret 
::
::::  /hoon/jael
  ::
!?  164
!:  ::
|=  pit/vase   
=>  =~
::  private structures                                  ::  ::
::::                                                    ::  ::
  ::                                                    ::  ::
|%
++  jael-state                                          ::  all crypto state
  $:  ver/$0                                            ::  %jael version 
      nav/jael-objective                                ::  all universal state
  ::  nix/jael-subjective                               ::  all derived state
  ==                                                    ::
++  jael-objective                                      ::  all universal state
  $:  urb/jael-urbit                                    ::  all urbit state
      web/(map (list @ta) jael-web-domain)              ::  all web state
  ==                                                    ::
++  jael-web-domain                                     ::  per foreign app
  $:  sec/(map @t jael-web-app)                         ::  client per api key
      usr/(map @ta jael-web-user)                       ::  direct user info
  ==                                                    ::
++  jael-web-app                                        ::  local app
  $:  key/(unit (pair @da @))                           ::  API key
      tok/(map @t (pair @da @))                         ::  token by username
  ==                                                    ::
++  jael-web-user                                       ::  per-user secrets
  $:  pas/(unit @t)                                     ::  password
      dey/(unit @t)                                     ::  display name
  ==                                                    ::
++  jael-urbit                                          ::  objective urbit
  $:  pug/gree                                          ::  all public state
      pry/(map ship jael-ship)                          ::  all private state
  ==                                                    ::
++  jael-ship                                           ::  objective by ship
  $:  rel/(map ship jael-friend)                        ::  relationships
      own/(map life ring)                               ::  private keys
      vew/(set duct)                                    ::  watchers
  ==                                                    ::
++  jael-friend                                         ::  relationship 
  $:  luf/(unit life)                                   ::  life as known to
      lab/(nap jael-right)                              ::  promises to
      vow/(set duct)                                    ::  watchers
  ==                                                    ::
++  jael-right                                          ::  urbit commitment
  $%  {$block p/pile}                                   ::  reserved block
      {$email p/(set @ta)}                              ::  email addresses
      {$entry p/(map hand (pair @da code))}             ::  symmetric keys
      {$final p/(map ship @uvG)}                        ::  ticketed ships
      {$fungi p/(map term @ud)}                         ::  fungibles
      {$guest $~}                                       ::  refugee visa
      {$lived p/life}                                   ::  PKI commitment
  ==                                                    ::
++  jael-task                                           ::  operations on
  $%  {$give p/ship q/(nap jael-right)}                 ::  add rights
      {$line p/ship q/@da r/code}                       ::  outbound symkey
      {$link p/ship q/@da r/code}                       ::  inbound symkey
      {$meet p/ship q/gree}                             ::  integrate pki from
      {$over p/ship q/jael-task}                        ::  mirror operation
      {$pall p/ship q/life}                             ::  our life acked
      {$step p/lamp}                                    ::  update private key
      {$take p/ship q/(nap jael-right)}                 ::  subtract rights
      {$vain $~}                                        ::  watch self
      {$vest $~}                                        ::  watch assets
      {$view p/ship}                                    ::  watch urbit
      {$vile p/(list @ta)}                              ::  watch website
      {$west p/ship q/path r/*}                         ::  remote request
      {$wink p/@ta q/@t r/(unit (pair @da @))}          ::  set API key
      {$wonk p/@ta q/@t r/@t s/(unit (pair @da @))}     ::  set API token
  ==                                                    ::
++  jael-report-them                                    ::  report on neighbor
  $:  gur/grue                                          ::  certificate
      lab/(nap jael-right)                              ::  our promises to
      own/(nap jael-right)                              ::  our promises from
  ==                                                    ::
++  jael-report-self                                    ::  report on self
  $:  gur/grue                                          ::  certificate
      war/(map life ring)                               ::  private keys
  ==                                                    ::
++  jael-report-cash                                    ::  neighbors/assets
  $:  has/(map ship (nap jael-right))                   ::
  ==                                                    ::
++  jael-report-paid                                    ::  asset diff
  $:  dif/(list (trel ship ? (nap jael-right)))         ::  who, +/-, what
  ==                                                    ::
::                                                      ::
++  jael-note                                           ::  out request $->
  $%  {$x $mess p/ship q/path r/*}                      ::  send message
  ==                                                    ::
++  jael-gift                                           ::  output
  $?  {$cash jael-report-cash}                          ::  asset dump
      {$clue jael-report-them}                          ::  channel dump
      {$paid jael-report-paid}                          ::  asset update
      {$self jael-report-self}                          ::  self dump
      {$well jael-web-domain}                           ::  service update
  ==                                                    ::
++  jael-message                                        ::  p2p message
  $%  {$hail p/(nap jael-right)}                        ::  re/set rights
      {$ping p/gree}                                    ::  propagate
  ==                                                    ::
++  jael-edit                                         ::  pki change
  $:  why/?($hear $make)                                ::  import or create
      gut/jael-change                                   ::  new information
  ==                                                    ::
++  jael-effect                                         ::  objective effect
  $%  {$kick p/ship}                                    ::  major update
      {$site p/(list @ta)}                              ::  
      {$slap p/ship q/ship}                             ::  relationship update
      {$ping p/ship q/gree}                             ::  propagate pki to
  ==                                                    ::
++  jael-change                                         ::  pki delta
  $%  {$step p/ship q/life r/lace}                      ::  new deed
      {$sure p/ship q/life r/mind s/@}                  ::  new signature
  ==                                                    ::
++  move  {p/duct q/(wind jael-note jael-gift)}         ::  local move
--                                                      ::
.  ==                                                   ::
=|  lex/jael-state                                      ::  kernel state
|=  $:  now/@da                                         ::  current time
        eny/@                                           ::  unique entropy
        ski/sley                                        ::  current invocation
    ==
::                                                      ::  ::
::::                                                    ::::::  interface
  ::                                                    ::  ::
=<  |%
    ::                                                  ::
    ++  call                                            ::  request
      |=  $:  ::  hen: cause of this event
              ::  hic: event data
              ::
              hen/duct
              hic/(hypo (hobo jael-task))
          ==
      =>  .(q.hic ?.(?=($soft -.q.hic) q.hic ((hard jael-task) p.q.hic)))
      ^-  {p/(list move) q/_..^$}
      =^  did  lex  abet:(^call hen q.hic)
      [did ..^$]
    ::                                                  ::
    ++  doze                                            ::  await
      |=  $:  ::  now: current time
              ::  hen: cause (XX why we need this?)
              ::
              now/@da 
              hen/duct
          ==
      ^-  (unit @da)
      ~
    ::                                                  ::
    ++  load                                            ::  upgrade
      |=  $:  ::  old: previous state
              ::
              old/jael-state
          ==
      ^+  ..^$
      ..^$(lex old)
    ::                                                  ::
    ++  scry                                            ::  inspect
      |=  $:  ::  fur: event security
              ::  ren: access mode
              ::  why: owner
              ::  syd: desk (branch)
              ::  lot: case (version)
              ::  tyl: rest of path
              ::
              fur/(unit (set monk))
              ren/@tas 
              why/shop 
              syd/desk 
              lot/coin 
              tyl/spur
          ==
      ^-  (unit (unit cage))
      !!
    ::                                                  ::
    ++  stay                                            ::  preserve
      lex
    ::                                                  ::
    ++  take                                            ::  accept
      |=  $:  ::  tea: order
              ::  hen: cause
              ::  hin: result
              ::
              tea/wire 
              hen/duct 
              hin/(hypo sign-arvo)
          ==
      ^-  {p/(list move) q/_..^$}
      [~ ..^$]
    --
::                                                      ::  ::
::::                                                    ::::::  control
  ::                                                    ::  ::
=<  =+  moz/(list move)
    |%
    ::                                                  ::
    ++  abet                                            ::  resolve
      [(flop moz) lex]
    ::                                                  ::
    ++  emil                                            ::  effects
      |=  moz/(list move)
      ^+(moz (weld (flop moz) ^moz))
    ::                                                  ::
    ++  emit                                            ::  effect
      |=  mov/move
      ^+(moz [mov moz])  
    ::                                                  ::
    ++  call                                            ::  invoke
      |=  {hen/duct tac/jael-task}
      ^+  +>
      ?+    -.tac  !!
          $give
        =<  abet
        =<  abet
        (give:(unto:(from our) p.tac) q.tac)
      ::
          $link
        =*  ryt  [%entry [[(shaf %hand r.tac) q.tac r.tac] ~ ~]]
        =<  abet
        =<  abet
        (give:(unto:(from our) p.tac) [ryt ~ ~])
      ::
          $line
        =*  ryt  [%entry [[(shaf %hand r.tac) q.tac r.tac] ~ ~]]
        =<  abet
        =<  abet
        (give:(unto:(from p.tac) our) [ryt ~ ~])
      ::
          $meet
        =/  rod  urb  (~(meet ur urb) p.tac q.tac)
        |-  ^+  ..call
        ?~  rod  ..call
        =.  ..call  (join i.rod)

        $(rod t.rod, ..call (make:(join i.rod) i.rod))
      ::
          $over
        $(our p.tac, tac q.tac)
      ::
          $pall
        !!
        ::  =<  abet
        ::  =<  abet
        ::  (pall:(unto:(from our) p.tac) q.tac)
      ==
    --
::                                                      ::
::::                                                    ::  system
  ::                                                    ::::::
|%
::                                                      ::  ur
++  ur                                                  ::  urbit core
  =|  $:  ::  now: current time
          ::  eny: unique entropy
          ::  +>+: all urbit state
          ::
          now/@da
          eny/@e
          jael-urbit
      ==
  =*  urb  +>+
  ::
  ::  rod: output from this core
  ::
  =|  rod/(list jael-effect)
  |%
  ::                                                    ::  abet:ur
  ++  abet                                              ::  resolve
    [(flop rod) urb]
  ::
  ++  join                                              ::  join:ur
    |=  $:  ::  fex: literal changes to pki
            ::
            fex/(list jael-edit)
    ^+  +>
    |=  fex/(list jael-edit)

  ::                                                    ::  make:ur
  ++  make                                              ::  propagate edits
    |=  $:  ::  fex: literal changes to pki
            ::
            fex/(list jael-edit)
        ==
    ^-  (list jael-effect)

  --
::                                                      ::  meet:ur
++  meet                                                ::  merge worlds
  |=  $:  ::  via: source of new info
          ::  new: new pki info
          ::  old: current pki info
          ::
          via/@p
          new/gree 
      ==
  ^-  (list jael-edit)
  |^  ::
      ::  check new info ship by ship
      ::
      =+  (~(tap by new))
      |-  ^-  (list jael-edit)
      ?~  +<  ~
      (weld (boat i.+<) $(+< t.+<))
  ::                                                    ::
  ++  boat                                              ::  merge ships
    |=  $:  ::  who: this ship
            ::  gur: new will for this ship
            ::
            who/ship 
            gur/grue
        ==
    ^-  (list jael-edit)
    ::
    ::  rug: old will for this ship
    ::
    =+  rug=(fall (~(get by pug.urb.nav.lex) who) *grue)
    ?:  =(gur rug)  ~
    =+  :*  ::
            ::  num: life counter
            ::  end: last life in old or new ship
            ::
            num=`life`1
            end=(max p.gur p.rug)
        ==
    =|  $:  ::  pre: previous deed
            ::  fex: edits in reverse order
            ::
            pre/(unit lama)
            fex/(list jael-edit)
        ==
    |-  ^+  fex
    ::
    ::  merge all lives in :%
    ::
    ?:  (gth num end)  
      (flop fex)
    =+  lub=(bonk who num pre (~(get by q.rug) num) (~(get by q.gur) num))
    %=  $
      num  +(num)
      pre  `p.lub
      fex  (weld (flop q.lub) fex)
    ==
  ::                                                    ::
  ++  bonk                                              ::  merge lives
    |=  $:  ::  who: ship we're merging
            ::  num: life we're merging
            ::  pre: previous deed 
            ::  lod: old deed
            ::  wan: new deed
            ::
            who/ship
            num/@ud
            pre/(unit lama)
            lod/(unit lace)
            wan/(unit lace)
        ==
    ^-  $:  ::  p: next previous deed
            ::  q: edits in order
            ::
            p/lama
            q/(list jael-edit)
        ==
    ::
    ::  if no new information, do nothing
    ::
    ?:  |(?=($~ wan) =(wan lod))
      ?>  ?=(^ lod) 
      [dat.u.lod ~]
    ::
    ::  ash: hash of deed content
    ::  def: our default parent
    ::  dad: our declared parent
    ::  mir: our rank
    ::
    =/  ash  (sham dat.u.wan)
    =/  def  (sein who)
    =*  dad  dad.doc.dat.u.wan
    =/  mir  (clan who)
    ?>  ?:  |(=(num 1) =(%earl mir) =(%pawn mir))
          ::
          ::  comets and moons must stay with default parent
          ::
          =(def dad)
        ::
        ::  other ships may migrate to parent of same rank
        ::
        =((clan def) (clan dad))
    ::
    ::  if we have an old deed at this life, merge them
    ::
    ?:  ?=(^ lod)
      ::
      ::  use the old deed as the next previous
      ::
      :-  dat.u.lod
      ::
      ::  deed data must be identical
      ::
      ?>  =(dat.u.wan dat.u.lod)
      ::
      ::  sow: all new signatures
      ::
      =+  sow=`(list (trel ship life @))`(~(tap by syg.u.wan))
      |-  ^-  (list jael-edit)
      ?~  sow  ~
      ::
      ::  mor: all further edits
      ::  och: old signature for this signer
      ::
      =+  mor=$(sow t.sow)
      =+  och=(~(get by syg.u.lod) p.i.sow)
      ::
      ::  ignore obsolete or equal signature
      ::
      ?.  |(?=($~ och) (gth q.i.sow p.u.och))
        mor
      ::
      ::  check and merge new, or newer, signature
      ::
      ?>  (good [p q]:i.sow ash r.i.sow)
      :_(mor [%make %sure who num [p q]:i.sow r.i.sow])
    ::
    ::  use the new deed as the next previous
    ::
    :-  dat.u.wan
    ::
    ::  non-initial deeds must be signed by previous
    ::
    ?>  ?|  ?=($~ pre)
            =+  laz=(~(got by syg.u.wan) who)
            ?>  =(p.laz (dec num))
            =(ash (need (sure:as:(com:nu:crub pub.u.pre) *code q.laz)))
        ==
    ::
    ::  check the parent has signed, if necessary
    ::
    ?>  ?|  ::
            ::  no parent signature for existing, non-moon urbits
            ::
            ?&  ?=(^ pre)
                =(dad.doc.u.pre dad)
                !=(%earl mir)
            ==
            ::
            ::  public keys for galaxies are hardcoded
            ::
            ?&  =(%czar mir)
                ?=($~ pre)
                =(pub.dat.u.wan (zeno who))
            ==
            ::
            ::  the deed's secure channel authenticates it
            ::
            =(via who)
            ::
            ::  check valid parent signature
            ::
            =+  par=(~(got by syg.u.wan) dad)
            (good [dad p.par] ash q.par)
        ==
    ::  tep: deed update 
    ::
    =/  tep  [%hear %step who num u.wan]
    ::
    ::  if we don't need to add a signature, report the new deed
    ::
    ?:  (~(has by syg.u.wan) dad)
      [tep ~]
    ::
    ::  lyf: life of parent
    ::  rig: secret key of parent
    ::  val: new signature
    ::
    =*  lyf  p:(~(got by pug.urb.nav.lex) dad)
    =*  rig  (~(got by own:(~(got by pry.urb.nav.lex) dad)) lyf)
    =*  val  (sign:as:(nol:nu:crub rig) *@ ash)
    [tep [%make %sure who num [dad lyf] val] ~]
  ::                                                    ::
  ++  look                                              ::  get public key
    |=  myn/mind 
    ^-  @
    ::
    ::  first galaxy key is hardcoded
    ::
    ?:  &((lth who.myn 256) =(1 lyf.myn))
      (zeno who.myn) 
    ::
    ::  cascade search over old and new, new first
    ::
    |^  ((bond |.((need find))) find(pug.urb.nav.lex new))
    ++  find
      ^-  (unit @)
      %+  biff  (~(get by pug.urb.nav.lex) who.myn)
      |=  gur/grue
      ::
      ::  crash if this life is revoked
      ::
      ?>  =(p.gur lyf.myn)
      %+  biff  (~(get by q.gur) lyf.myn)
      |=(lace `pub.dat)
    --
  ::                                                    ::
  ++  good                                              ::  verify signature
    |=  {myn/mind ash/@ val/@}
    ^-  ?
    ?>(=(ash (need (sure:as:(com:nu:crub (look myn)) *code val))) &)
  --
::
++  
::                                                      ::
++  etch                                                :: 
  |=  
++  from
  |=  rex/ship
  =+  ((bond |.(*jael-ship)) (~(get by pry.urb.nav.lex) rex))
  |%
  ++  abet  
    ^+  ..from
    ..from(pry.urb.nav (~(put by pry.urb.nav.lex) rex `jael-ship`+<))
  ::
  ++  unto
    |=  pal/ship
    =+  ((bond |.(*jael-friend)) (~(get by rel) pal))
    |%
    ++  abet                                            ::  resolve
      ^+  ..unto
      ..unto(rel (~(put by rel) pal `jael-friend`+<))
    ::
    ++  give
      |=  lab/(nap jael-right)
      ^+  +>
      !!
    ::
    ++  pall
      |=  lyf/life
      !!
    --
  --
::                                                      ::
++  zeno                                                ::  insert signature
  |=  who/ship
  ^-  pass
  !!
--
