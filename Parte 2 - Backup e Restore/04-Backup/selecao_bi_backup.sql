PGDMP      ,                 }         
   selecao_bi    16.6    16.6     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    163317 
   selecao_bi    DATABASE     �   CREATE DATABASE selecao_bi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE selecao_bi;
                postgres    false            �            1259    163319 
   candidatos    TABLE     �   CREATE TABLE public.candidatos (
    id integer NOT NULL,
    nome character varying NOT NULL,
    email character varying NOT NULL,
    data_aplicacao timestamp without time zone NOT NULL,
    modificado_por character varying
);
    DROP TABLE public.candidatos;
       public         heap    postgres    false            �            1259    163318    candidatos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.candidatos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.candidatos_id_seq;
       public          postgres    false    216            �           0    0    candidatos_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.candidatos_id_seq OWNED BY public.candidatos.id;
          public          postgres    false    215            �            1259    163328    habilidades    TABLE     �   CREATE TABLE public.habilidades (
    id integer NOT NULL,
    candidato_id integer NOT NULL,
    habilidade character varying NOT NULL
);
    DROP TABLE public.habilidades;
       public         heap    postgres    false            �            1259    163327    habilidades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.habilidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.habilidades_id_seq;
       public          postgres    false    218            �           0    0    habilidades_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.habilidades_id_seq OWNED BY public.habilidades.id;
          public          postgres    false    217            U           2604    163322    candidatos id    DEFAULT     n   ALTER TABLE ONLY public.candidatos ALTER COLUMN id SET DEFAULT nextval('public.candidatos_id_seq'::regclass);
 <   ALTER TABLE public.candidatos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            V           2604    163331    habilidades id    DEFAULT     p   ALTER TABLE ONLY public.habilidades ALTER COLUMN id SET DEFAULT nextval('public.habilidades_id_seq'::regclass);
 =   ALTER TABLE public.habilidades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �          0    163319 
   candidatos 
   TABLE DATA           U   COPY public.candidatos (id, nome, email, data_aplicacao, modificado_por) FROM stdin;
    public          postgres    false    216   Q       �          0    163328    habilidades 
   TABLE DATA           C   COPY public.habilidades (id, candidato_id, habilidade) FROM stdin;
    public          postgres    false    218   n       �           0    0    candidatos_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.candidatos_id_seq', 1, false);
          public          postgres    false    215            �           0    0    habilidades_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.habilidades_id_seq', 1, false);
          public          postgres    false    217            X           2606    163326    candidatos candidatos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.candidatos DROP CONSTRAINT candidatos_pkey;
       public            postgres    false    216            Z           2606    163335    habilidades habilidades_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT habilidades_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.habilidades DROP CONSTRAINT habilidades_pkey;
       public            postgres    false    218            [           2606    163336    habilidades fk_candidato    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilidades
    ADD CONSTRAINT fk_candidato FOREIGN KEY (candidato_id) REFERENCES public.candidatos(id);
 B   ALTER TABLE ONLY public.habilidades DROP CONSTRAINT fk_candidato;
       public          postgres    false    218    216    4696            �      x������ � �      �      x������ � �     