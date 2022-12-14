PGDMP         $                 z            wordGame    14.2    14.2 /    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            /           1262    16421    wordGame    DATABASE     U   CREATE DATABASE "wordGame" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE "wordGame";
                postgres    false            ?            1259    16492    easy    TABLE     W   CREATE TABLE public.easy (
    id integer NOT NULL,
    word character(30) NOT NULL
);
    DROP TABLE public.easy;
       public         heap    postgres    false            ?            1259    16491    easy_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.easy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.easy_id_seq;
       public          postgres    false    210            0           0    0    easy_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.easy_id_seq OWNED BY public.easy.id;
          public          postgres    false    209            ?            1259    16507    hard    TABLE     W   CREATE TABLE public.hard (
    id integer NOT NULL,
    word character(30) NOT NULL
);
    DROP TABLE public.hard;
       public         heap    postgres    false            ?            1259    16506    hard_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.hard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.hard_id_seq;
       public          postgres    false    214            1           0    0    hard_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.hard_id_seq OWNED BY public.hard.id;
          public          postgres    false    213            ?            1259    16499    medium    TABLE     Y   CREATE TABLE public.medium (
    id integer NOT NULL,
    word character(30) NOT NULL
);
    DROP TABLE public.medium;
       public         heap    postgres    false            ?            1259    16498    medium_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.medium_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.medium_id_seq;
       public          postgres    false    212            2           0    0    medium_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.medium_id_seq OWNED BY public.medium.id;
          public          postgres    false    211            ?            1259    16597    records    TABLE     ?   CREATE TABLE public.records (
    id integer NOT NULL,
    userid integer NOT NULL,
    level character(20) NOT NULL,
    word character(20) NOT NULL,
    score integer NOT NULL,
    attempts integer NOT NULL,
    clues integer NOT NULL
);
    DROP TABLE public.records;
       public         heap    postgres    false            ?            1259    16596    records_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.records_id_seq;
       public          postgres    false    220            3           0    0    records_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.records_id_seq OWNED BY public.records.id;
          public          postgres    false    219            ?            1259    16590 
   user_roles    TABLE     ?   CREATE TABLE public.user_roles (
    id integer NOT NULL,
    user_name character(40) NOT NULL,
    role_name character(40) NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false            ?            1259    16589    user_roles_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.user_roles_id_seq;
       public          postgres    false    218            4           0    0    user_roles_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;
          public          postgres    false    217            ?            1259    16581    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    user_name character(40) NOT NULL,
    user_pass character(40) NOT NULL,
    coins integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16580    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    216            5           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215                       2604    16495    easy id    DEFAULT     b   ALTER TABLE ONLY public.easy ALTER COLUMN id SET DEFAULT nextval('public.easy_id_seq'::regclass);
 6   ALTER TABLE public.easy ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            ?           2604    16510    hard id    DEFAULT     b   ALTER TABLE ONLY public.hard ALTER COLUMN id SET DEFAULT nextval('public.hard_id_seq'::regclass);
 6   ALTER TABLE public.hard ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            ?           2604    16502 	   medium id    DEFAULT     f   ALTER TABLE ONLY public.medium ALTER COLUMN id SET DEFAULT nextval('public.medium_id_seq'::regclass);
 8   ALTER TABLE public.medium ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            ?           2604    16600 
   records id    DEFAULT     h   ALTER TABLE ONLY public.records ALTER COLUMN id SET DEFAULT nextval('public.records_id_seq'::regclass);
 9   ALTER TABLE public.records ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            ?           2604    16593    user_roles id    DEFAULT     n   ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);
 <   ALTER TABLE public.user_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            ?           2604    16584    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216                      0    16492    easy 
   TABLE DATA           (   COPY public.easy (id, word) FROM stdin;
    public          postgres    false    210   /       #          0    16507    hard 
   TABLE DATA           (   COPY public.hard (id, word) FROM stdin;
    public          postgres    false    214   82       !          0    16499    medium 
   TABLE DATA           *   COPY public.medium (id, word) FROM stdin;
    public          postgres    false    212   ?6       )          0    16597    records 
   TABLE DATA           R   COPY public.records (id, userid, level, word, score, attempts, clues) FROM stdin;
    public          postgres    false    220   ?9       '          0    16590 
   user_roles 
   TABLE DATA           >   COPY public.user_roles (id, user_name, role_name) FROM stdin;
    public          postgres    false    218   ?;       %          0    16581    users 
   TABLE DATA           @   COPY public.users (id, user_name, user_pass, coins) FROM stdin;
    public          postgres    false    216   F<       6           0    0    easy_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.easy_id_seq', 110, true);
          public          postgres    false    209            7           0    0    hard_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.hard_id_seq', 167, true);
          public          postgres    false    213            8           0    0    medium_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.medium_id_seq', 122, true);
          public          postgres    false    211            9           0    0    records_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.records_id_seq', 42, true);
          public          postgres    false    219            :           0    0    user_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_roles_id_seq', 7, true);
          public          postgres    false    217            ;           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 14, true);
          public          postgres    false    215            ?           2606    16497    easy easy_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.easy
    ADD CONSTRAINT easy_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.easy DROP CONSTRAINT easy_pkey;
       public            postgres    false    210            ?           2606    16512    hard hard_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.hard
    ADD CONSTRAINT hard_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.hard DROP CONSTRAINT hard_pkey;
       public            postgres    false    214            ?           2606    16504    medium medium_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.medium
    ADD CONSTRAINT medium_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.medium DROP CONSTRAINT medium_pkey;
       public            postgres    false    212            ?           2606    16602    records records_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.records DROP CONSTRAINT records_pkey;
       public            postgres    false    220            ?           2606    16595    user_roles user_roles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    218            ?           2606    16586    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            ?           2606    16588    users users_user_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_name_key;
       public            postgres    false    216               !  x??????0Fk?S??ď(=?&E??it?k$? ?r?>?`'?>????}?@~26???_??*N?}??l??j?J???]??U?j?14܍??]???? 3?kP?	???D?;;[7D	?y??M&?N?	?|???;??*???˅_????sʵ> ?B??K0Ev:_??L<ZB?/??y?#(???@B??pE?`????!????*?)?΋h?p݆	???N$FAqN?!?<??h;?8??Ou??)??wCJĄz!%N??xn?`??N??6?`???? 1?Nq?vB?8R??????Q?S;??R???8?D!D8??P???e)?????o+??Jv:v??#G?$????$??????d?2!?רr!???N??ád????܉ؾ~?4pQ+T??91RT??䖪?A8???S%N??_05T?Ӈ?fx????Oܧ?t2??'?A?S|?#???tZWB?x?Q?N??ق???ypj}?p?jv?:?7*5??%7L?9uC?l?B?1??F	pةa??N?M?"ةs?0?h%jĩc?p*q???Uĩ_??????!-N??xG!-N?l?????4???ۛ?s???6y?F'?8???8ݖ+??t???5?N?St.???????~"????;??_"?w?UB??|??A??o?'????B???mv?w??0?V?Db?Zqz??~?e/hed??΢,?ٮ5xӡŝg?@n?a?<?;??H?D`???>?^%K??Hs:?J???.?????T??
Ú8??߈???:      #   =  x?}?M??8???)???11?٨1??B???w?????????T>??7?ϕ?5?,?0@-@?O+???'? V????am??
_S&?pY?`=? ƇA??`kQ?D?@|X??A?%?h@,??fF??i|?qOBt??v???~'?3ݿ?	8???(%~?N????f???Tb)BWVJ|?%?q%?>?U?~???-????V??C>?!?:????j??<?/"?N?9.???L?p:?N?U?U?݆p?s??$'?U?N??9?:%=??".??u???8eW?)??Ax%??|!ʝ?H3y???	?????>??#Xg?n??????N?
?{?>??ø?? ?ʻe?AD??\S??????0???Vb??????N?>???ĊT	8???????JX;v???Zu??h?)?'8??Q-?F?G[+??D???J???l?4f?.]?+?????)??-?4YN;8M۝??+??UJ,?u??i???s]s?V]?*a???d??+?_?u?/"m??q}?ě???.?8?25??^?F???4??B?F?}!N#i?!N?9B??4G_?A	??q???kJ?Ӹ??V	q???
!N??0?s?8M????A?&???4Ib????i?|?n?A?L??┍?;???ݐ?Ĩ"A???*?&k?Ħ?
 ̚???}??B?v?Ξ/ w%??@?y??#R?͎T?k?V ?????J6?)R+2?2?
???/A?a???7?z?ݷu?zd?d4dM???hw?t%?q{ī??S*E??? ???ji??n?4i?ܧ+/)d??U?Y?p??;b?t?;/7ڢ|?$??$H?	g??v???ޑg ??????ӕ-?v?'?N?5F ???cd?>?y.kN?2???t>'?V?v????$?Z' ?+?3?G??? ?&??i???n?^?2???ݍ?nE`w3R? ???W??M;"v7????ͳU?H`??ͧ????1?D??9????7?)??֌?6C?G{?c?ؗ???G?z?_i!? ?.??(?o?߿?s????b      !   P  x?}?Kn?0?מS?????E׽@7???DdѠ? ??;3r??????A???q/a\^??*OӸL>??f??.???@??}.@#?xs?~g?? ??t
L?{z?6?h?A?m@??B?=?E8?????L??&aBl??5?脋P?Q?82?*??C?? ??Rr?4? ?!7(?D?R???^Jq??,B???E?S`B?n??Jq??kDۡ??L?nq"??nl?Jv?9?+$ة??9?l??O"d?*?$P?PU
??C	v???*?	?\?(??????????;?????Υ????j? P?????G?)????? ???֕???+????3ι?Q???z%?Ob??L]???k>?K?X??A?P?F?.???Ѩ?2j?i'?PS}a???Mj????Q?N???F??|B?&\??Q?Vuhĩ7Z)???Oo!N???R	?jũ?C0!N?=L(????(?Ԋ?0?y???8?B??a????? n1?)????[X???i.??q?8ê݉?????i?ٙO1??:q?qr?ӛ?(B?uO?>???{?͒:v?|{??n{?Ӑ&x?c?)???-_??g?L?$*!8?a??	??????[!??A?t?q:??n??????p?r??? R???h`??G?T?T??bCu?S
?N??}??qG? D???X?8??D?$`?i???+D??Q???F\Q?q!/?kܸ$b?>?R]!f?n?;W???D??????j?fW??8Zwj'O????	?.?H)??J?????`??Ƌ?iyW??W?????U?.??wP?????ђ???
<FE?x?o??@&?oF??2R??R?????.?9      )   ?  x??UMo?0<ۿb?
?@??X?kL?H{??H?!?]????41K?'??0??'?ǿo?????{???7EV???򀺜?^^/???Q.*?E8Ψ?T?~Pq?oEK?1?΁k???
?q?{?3?F?T????Ѻ61SM?ɭ6~?V}e:??T???? ?۹?o??
L5e??A?w???d?i?8yL[?a[?vJVR???,#A???5t;p???????i.l??A/?k?w?e?????\HrX???aڣ?8?FJ???3l??yLqU?g?C????:?NiX???Q<????[?S??????+5)???j<?a{?!c?G???Ϗ?6 ?k?)~q?´9a???\????????Qȯs	TMo??9q?D?A??xs?Saw????A?@\8??b??pz??&pH8?$??2l???`%8:z??X?zO-s{%^?*??b?Ɏ?n????Y???E???OJ????v?      '   b   x?3?L/M-.Q 8r+S?+?2?442&?DR?4?L??K-? ???bbL?i?I?2??D?Ӕ?8?(1??f???Ӕ#I0Ӝ??Ғ#I03F??? ??Zj      %   -   x?3?L/M-.Q ?Whh`?e?ihdL?b?rbYr??qqq ?e?     