PGDMP     6    )                |            master_HR_db    14.1    14.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    138119    master_HR_db    DATABASE     Y   CREATE DATABASE "master_HR_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE "master_HR_db";
                postgres    false            �            1259    138127 
   department    TABLE     Z   CREATE TABLE public.department (
    id uuid NOT NULL,
    name character varying(500)
);
    DROP TABLE public.department;
       public         heap    postgres    false            �            1259    138154    employee    TABLE       CREATE TABLE public.employee (
    id uuid NOT NULL,
    firstname character varying(1000) NOT NULL,
    lastname character varying(1000),
    dateofbirth date,
    gender character varying(10),
    "position" character varying(1000),
    department_id uuid
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �          0    138127 
   department 
   TABLE DATA                 public          postgres    false    209   �
       �          0    138154    employee 
   TABLE DATA                 public          postgres    false    210   �       o           2606    138133    department department_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public            postgres    false    209            q           2606    138160    employee employee_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    210            r           2606    138161 "   employee fk_employee_on_department    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_on_department FOREIGN KEY (department_id) REFERENCES public.department(id);
 L   ALTER TABLE ONLY public.employee DROP CONSTRAINT fk_employee_on_department;
       public          postgres    false    209    210    3439            �   �  x����n1��~��9�B?��SѦ��$-b�wJ�\�������W�'����P����ۡ۽~t�9�O�S�+��E�������i�=l�����#��brP�����]�~�/<�����7��c�b�:P�(�jkc{�����r0�۩�>�
2Qh�j�� =jh4�l\ ϵ�B�>_����6�c����`���T`�"d�(�bKgQhl�1��/�W�+�ẐVHi#�j�XS>Z�.d(�F��O��"���Z�QGT�l* ���ؚ��u���/�m.2v��z�5։%��j����P �II	.��
�+����0�f�BőP�B&,П�P�<u/��QV�n0�9�v��}U"g�J�%]�������k��}%MX %�2)�:g�ҭ��;��晧���{�l�ɝ�      �   �  x���[o$5���+�- Qȗ�]O!A"�EI��]&-:ݣ�dQ�=�sa�v�i5�G3��s�S}�����qu����j�Zơ~+��q~Y�v�ӯ7��.�-�do��G@�+���B�؈.�Y]��OӲ��eYl&&�����ݷ�䣌�Z6�A0�	Xz,ҁ}!���RS�j����]ܞ%��lMA0d=�Mr�YGh��h�K���r��2O����.G�?����,N����@C(�
-t5��¥��ՒoR]�.#(!x�n��B!c��?�'�q��>����/�m��<���[����!%���A �q@\x/���l7x��5IG6�hP$���	��	��&��ڼ-��������	c�G���l��d	.V�p���#eA�1��mm5o�A�<reȞ;+�-�.�/���E6�=�,M�sKt}QX���2@��R����2��k��Mh���n�:�q<��)c�_]��o��/�FH1c	0��b��Cv!�Ƚ������OQ�c��B#�=Q��iWs�8���h���������z=���,)4n�I��X�4N4")9�ٔZ�K�Ո��@!Z��r�%ĝ�;����]��7��bx�߫Z���X21J� �5�%�h7s3��>'w���W�9�KM1h:�r0�*)�xg��5	�O,�	7��̖14��Շ���Z�u�m����!p�ӾC���� 1��t���e�
vq�7�/�l     