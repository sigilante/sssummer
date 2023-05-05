/-  sum
/+  verb, dbug, *sss
::
%-  agent:dbug
%+  verb  &
=/  sub-sum  (mk-subs sum ,[%sum *])
=/  pub-sum  (mk-pubs sum ,[%sum %foo ~])
::
|_  =bowl:gall
+*  this  .
    da-sum  =/  da  (da sum ,[%sum *])
            (da sub-sum bowl -:!>(*result:da) -:!>(*from:da) -:!>(*fail:da))
    du-sum  =/  du  (du sum ,[%sum %foo ~])
            (du pub-sum bowl -:!>(*result:du))
::
++  on-init  `this
++  on-save  !>([sub-sum pub-sum])
++  on-load
  |=  =vase
  :-  ~
  =/  old  !<([=_sub-sum =_pub-sum] vase)
  %=  this
    sub-sum  sub-sum.old
    pub-sum  pub-sum.old
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card:agent:gall _this)
  ~&  >>  "sub-sum was: {<read:da-sum>}"
  ~&  >>  "pub-sum was: {<read:du-sum>}"
  ?+    mark  `this
      %do
    =^  cards  pub-sum  (give:du-sum [%sum %foo ~] !<([?(%add %sub) @ud] vase))
    ~&  >  "pub-sum is: {<read:du-sum>}"
    [cards this]
  ::
      %surf-sum
    =^  cards  sub-sum
      (surf:da-sum !<(@p (slot 2 vase)) %simple !<([%sum *] (slot 3 vase)))
    ~&  >  "sub-sum is: {<read:da-sum>}"
    [cards this]
  ::
      %sss-to-pub
    ?-  msg=!<($%(into:du-sum) (fled vase))
        [[%sum %foo ~] *]
      =^  cards  pub-sum  (apply:du-sum msg)
      [cards this]
    ==
  ::
      %sss-sum
    =^  cards  sub-sum  (apply:da-sum !<(into:da-sum (fled vase)))
    ~&  >  "sub-sum is: {<read:da-sum>}"
    [cards this]
  ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card:agent:gall _this)
  ?>  ?=(%poke-ack -.sign)
  ?~  p.sign  `this
  %-  (slog u.p.sign)
  ?+    wire   `this
      [~ %sss %on-rock @ @ @ %sum *]
    =.  sub-sum  (chit:da-sum |3:wire sign)
    ~&  >  "sub-sum is: {<read:da-sum>}"
    `this
  ::
      [~ %sss %scry-request @ @ @ %sum *]
    =^  cards  sub-sum  (tell:da-sum |3:wire sign)
    ~&  >  "sub-sum is: {<read:da-sum>}"
    [cards this]
  ==
::
++  on-arvo
  |=  [=wire sign=sign-arvo]
  ^-  (quip card:agent:gall _this)
  ?+  wire  `this
    [~ %sss %behn @ @ @ %sum *]  [(behn:da-sum |3:wire) this]
  ==
::
++  on-peek   _~
++  on-watch  _`this
++  on-leave  _`this
++  on-fail   _`this
--
