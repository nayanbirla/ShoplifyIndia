PGDMP     +    !                 {         
   Electronic    12.12    12.12                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    49612 
   Electronic    DATABASE     �   CREATE DATABASE "Electronic" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE "Electronic";
                postgres    false            �            1259    49631    orders    TABLE     |   CREATE TABLE public.orders (
    oid integer NOT NULL,
    pid integer,
    uid integer,
    qty integer,
    odate date
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    49629    orders_oid_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_oid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.orders_oid_seq;
       public          postgres    false    207            !           0    0    orders_oid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.orders_oid_seq OWNED BY public.orders.oid;
          public          postgres    false    206            �            1259    49623    product    TABLE     �   CREATE TABLE public.product (
    pid integer NOT NULL,
    pname character varying(50),
    category character varying(50),
    price double precision,
    image character varying(100)
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    49621    product_pid_seq    SEQUENCE     �   CREATE SEQUENCE public.product_pid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.product_pid_seq;
       public          postgres    false    205            "           0    0    product_pid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.product_pid_seq OWNED BY public.product.pid;
          public          postgres    false    204            �            1259    49615    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    uname character varying(50),
    email character varying(50),
    pass character varying(50),
    typ integer DEFAULT 0
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    49613    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    203            #           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    202            �
           2604    49634 
   orders oid    DEFAULT     h   ALTER TABLE ONLY public.orders ALTER COLUMN oid SET DEFAULT nextval('public.orders_oid_seq'::regclass);
 9   ALTER TABLE public.orders ALTER COLUMN oid DROP DEFAULT;
       public          postgres    false    207    206    207            �
           2604    49626    product pid    DEFAULT     j   ALTER TABLE ONLY public.product ALTER COLUMN pid SET DEFAULT nextval('public.product_pid_seq'::regclass);
 :   ALTER TABLE public.product ALTER COLUMN pid DROP DEFAULT;
       public          postgres    false    205    204    205            �
           2604    49618    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203                      0    49631    orders 
   TABLE DATA           ;   COPY public.orders (oid, pid, uid, qty, odate) FROM stdin;
    public          postgres    false    207                    0    49623    product 
   TABLE DATA           E   COPY public.product (pid, pname, category, price, image) FROM stdin;
    public          postgres    false    205   �                 0    49615    users 
   TABLE DATA           <   COPY public.users (id, uname, email, pass, typ) FROM stdin;
    public          postgres    false    203   �       $           0    0    orders_oid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.orders_oid_seq', 26, true);
          public          postgres    false    206            %           0    0    product_pid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_pid_seq', 4, true);
          public          postgres    false    204            &           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    202            �
           2606    49636    orders orders_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (oid);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    207            �
           2606    49628    product product_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (pid);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    205            �
           2606    49620    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            �
           2606    49642    orders fk_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_product FOREIGN KEY (pid) REFERENCES public.product(pid) ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_product;
       public          postgres    false    207    205    2706            �
           2606    49637    orders fk_users    FK CONSTRAINT     |   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_users FOREIGN KEY (uid) REFERENCES public.users(id) ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_users;
       public          postgres    false    203    2704    207               n   x�m��� �o���;��]��EL�6|�p `U��&(?��O�ͪ��cL���/_X����B]��|�39&X�۫�dY74��̰�z2O�
���j�!"�8,         b   x�u�1
�0���Z[Z��!F���7��n9��2F]��Y0�%��|Ad1�������N
��e���3P�X-��芡Ҭ��ߪ�̆�^`�(%         �   x�m�A� ��p
O�8Pv�nܺ�(	����5j�|��' �i�Ɯ7i����ɺ�< ��=�p�>�H�EMJ�Z�R�/![���P������mMG�!��e%���)�L��7��T�����\|ɗ�ɯ�|pi��a��  �V8     