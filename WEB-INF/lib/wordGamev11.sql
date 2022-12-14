PGDMP         7                z            wordGame    11.16    11.16                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16412    wordGame    DATABASE     ?   CREATE DATABASE "wordGame" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE "wordGame";
             postgres    false            ?            1259    16440    easy    TABLE     W   CREATE TABLE public.easy (
    id integer NOT NULL,
    word character(40) NOT NULL
);
    DROP TABLE public.easy;
       public         postgres    false            ?            1259    16438    easy_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.easy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.easy_id_seq;
       public       postgres    false    202                       0    0    easy_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.easy_id_seq OWNED BY public.easy.id;
            public       postgres    false    201            ?            1259    16432    records    TABLE     ?   CREATE TABLE public.records (
    sno integer NOT NULL,
    userid integer NOT NULL,
    level character(20) NOT NULL,
    word character(30) NOT NULL,
    score integer NOT NULL,
    attempts integer NOT NULL,
    clues integer NOT NULL
);
    DROP TABLE public.records;
       public         postgres    false            ?            1259    16430    records_sno_seq    SEQUENCE     ?   CREATE SEQUENCE public.records_sno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.records_sno_seq;
       public       postgres    false    200                       0    0    records_sno_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.records_sno_seq OWNED BY public.records.sno;
            public       postgres    false    199            ?            1259    16418 
   user_roles    TABLE        CREATE TABLE public.user_roles (
    user_name character varying(15) NOT NULL,
    role_name character varying(15) NOT NULL
);
    DROP TABLE public.user_roles;
       public         postgres    false            ?            1259    16413    users    TABLE     ?   CREATE TABLE public.users (
    user_name character varying(15) NOT NULL,
    user_pass character varying(15) NOT NULL,
    coins integer,
    id integer NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false            ?            1259    16423    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    196                        0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    198            ?
           2604    16443    easy id    DEFAULT     b   ALTER TABLE ONLY public.easy ALTER COLUMN id SET DEFAULT nextval('public.easy_id_seq'::regclass);
 6   ALTER TABLE public.easy ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201    202            ?
           2604    16435    records sno    DEFAULT     j   ALTER TABLE ONLY public.records ALTER COLUMN sno SET DEFAULT nextval('public.records_sno_seq'::regclass);
 :   ALTER TABLE public.records ALTER COLUMN sno DROP DEFAULT;
       public       postgres    false    199    200    200            ?
           2604    16425    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    196                      0    16440    easy 
   TABLE DATA               (   COPY public.easy (id, word) FROM stdin;
    public       postgres    false    202   ?                 0    16432    records 
   TABLE DATA               S   COPY public.records (sno, userid, level, word, score, attempts, clues) FROM stdin;
    public       postgres    false    200   ?                 0    16418 
   user_roles 
   TABLE DATA               :   COPY public.user_roles (user_name, role_name) FROM stdin;
    public       postgres    false    197                    0    16413    users 
   TABLE DATA               @   COPY public.users (user_name, user_pass, coins, id) FROM stdin;
    public       postgres    false    196   5       !           0    0    easy_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.easy_id_seq', 1, false);
            public       postgres    false    201            "           0    0    records_sno_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.records_sno_seq', 1, true);
            public       postgres    false    199            #           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
            public       postgres    false    198            ?
           2606    16445    easy easy_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.easy
    ADD CONSTRAINT easy_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.easy DROP CONSTRAINT easy_pkey;
       public         postgres    false    202            ?
           2606    16437    records records_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (sno);
 >   ALTER TABLE ONLY public.records DROP CONSTRAINT records_pkey;
       public         postgres    false    200            ?
           2606    16422    user_roles user_roles_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_name, role_name);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public         postgres    false    197    197            ?
           2606    16417    users users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_name);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    196                  x?3?LLJV p??qqq ?O?         &   x?3?4?LM,?T@??N??b?҆@?\1z\\\ ??
         #   x?342?,?I?L-?J/M-.?qa?=... ?         /   x?342?4b#NC?????Nif?i?ehh?	?@i#?=... ?	?     