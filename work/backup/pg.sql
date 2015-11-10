PGDMP                 
    
    s            pulse    9.4.4    9.4.4 2               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       1262    16393    pulse    DATABASE     �   CREATE DATABASE pulse WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE pulse;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5                       0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5            �            3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    183            �            1259    16447    chain    TABLE     �   CREATE TABLE chain (
    chain_id integer NOT NULL,
    name character varying,
    "timestamp" timestamp without time zone,
    is_default boolean
);
    DROP TABLE public.chain;
       public         postgres    false    5            �            1259    16445    chain_chain_id_seq    SEQUENCE     t   CREATE SEQUENCE chain_chain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.chain_chain_id_seq;
       public       postgres    false    5    176                       0    0    chain_chain_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE chain_chain_id_seq OWNED BY chain.chain_id;
            public       postgres    false    175            �            1259    16472    contact    TABLE     �   CREATE TABLE contact (
    name character varying,
    email json,
    source character varying,
    contact_id integer NOT NULL
);
    DROP TABLE public.contact;
       public         postgres    false    5            �            1259    16478    contacts_contact_id_seq    SEQUENCE     y   CREATE SEQUENCE contacts_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.contacts_contact_id_seq;
       public       postgres    false    178    5                       0    0    contacts_contact_id_seq    SEQUENCE OWNED BY     D   ALTER SEQUENCE contacts_contact_id_seq OWNED BY contact.contact_id;
            public       postgres    false    179            �            1259    16433    puser    TABLE     �   CREATE TABLE puser (
    user_id integer NOT NULL,
    name character varying,
    default_chain_id integer,
    user_image json
);
    DROP TABLE public.puser;
       public         postgres    false    5            �            1259    16458    puser_chain    TABLE     u   CREATE TABLE puser_chain (
    user_id integer,
    chain_id integer,
    "timestamp" timestamp without time zone
);
    DROP TABLE public.puser_chain;
       public         postgres    false    5            �            1259    16522    puser_extension    TABLE     c   CREATE TABLE puser_extension (
    extension_id character varying NOT NULL,
    user_id integer
);
 #   DROP TABLE public.puser_extension;
       public         postgres    false    5            �            1259    16511    session    TABLE     �   CREATE TABLE session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.session;
       public         postgres    false    5            �            1259    16412    tag    TABLE     N  CREATE TABLE tag (
    file_id character varying(15) DEFAULT NULL::character varying,
    url character varying(255) DEFAULT NULL::character varying,
    share_status character varying(45) DEFAULT NULL::character varying,
    inner_text text,
    thoughts text,
    zoom character varying(45) DEFAULT NULL::character varying,
    "timestamp" timestamp without time zone,
    chain_id integer,
    tag_id character(15) NOT NULL,
    user_id integer,
    family json,
    placement json,
    image_target text,
    image_generic text,
    image_favicon text,
    page_title character(200)
);
    DROP TABLE public.tag;
       public         postgres    false    5            �            1259    41523    tag_comment    TABLE     �   CREATE TABLE tag_comment (
    tag_id character varying(15),
    user_id integer,
    "timestamp" timestamp without time zone,
    body text,
    comment_id character varying(15) NOT NULL
);
    DROP TABLE public.tag_comment;
       public         postgres    false    5            �            1259    16436    user_user_id_seq    SEQUENCE     r   CREATE SEQUENCE user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public       postgres    false    173    5                       0    0    user_user_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE user_user_id_seq OWNED BY puser.user_id;
            public       postgres    false    174            �           2604    16450    chain_id    DEFAULT     b   ALTER TABLE ONLY chain ALTER COLUMN chain_id SET DEFAULT nextval('chain_chain_id_seq'::regclass);
 =   ALTER TABLE public.chain ALTER COLUMN chain_id DROP DEFAULT;
       public       postgres    false    175    176    176            �           2604    16480 
   contact_id    DEFAULT     k   ALTER TABLE ONLY contact ALTER COLUMN contact_id SET DEFAULT nextval('contacts_contact_id_seq'::regclass);
 A   ALTER TABLE public.contact ALTER COLUMN contact_id DROP DEFAULT;
       public       postgres    false    179    178            �           2604    16438    user_id    DEFAULT     _   ALTER TABLE ONLY puser ALTER COLUMN user_id SET DEFAULT nextval('user_user_id_seq'::regclass);
 <   ALTER TABLE public.puser ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    174    173                      0    16447    chain 
   TABLE DATA               A   COPY chain (chain_id, name, "timestamp", is_default) FROM stdin;
    public       postgres    false    176   �5                   0    0    chain_chain_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('chain_chain_id_seq', 28, true);
            public       postgres    false    175                      0    16472    contact 
   TABLE DATA               ;   COPY contact (name, email, source, contact_id) FROM stdin;
    public       postgres    false    178   t6       !           0    0    contacts_contact_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('contacts_contact_id_seq', 1, false);
            public       postgres    false    179                      0    16433    puser 
   TABLE DATA               E   COPY puser (user_id, name, default_chain_id, user_image) FROM stdin;
    public       postgres    false    173   �6                 0    16458    puser_chain 
   TABLE DATA               >   COPY puser_chain (user_id, chain_id, "timestamp") FROM stdin;
    public       postgres    false    177   �6                 0    16522    puser_extension 
   TABLE DATA               9   COPY puser_extension (extension_id, user_id) FROM stdin;
    public       postgres    false    181   E7                 0    16511    session 
   TABLE DATA               -   COPY session (sid, sess, expire) FROM stdin;
    public       postgres    false    180   t7       
          0    16412    tag 
   TABLE DATA               �   COPY tag (file_id, url, share_status, inner_text, thoughts, zoom, "timestamp", chain_id, tag_id, user_id, family, placement, image_target, image_generic, image_favicon, page_title) FROM stdin;
    public       postgres    false    172   �8                 0    41523    tag_comment 
   TABLE DATA               N   COPY tag_comment (tag_id, user_id, "timestamp", body, comment_id) FROM stdin;
    public       postgres    false    182   FT       "           0    0    user_user_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('user_user_id_seq', 3, true);
            public       postgres    false    174            �           2606    16455    chain_pk 
   CONSTRAINT     K   ALTER TABLE ONLY chain
    ADD CONSTRAINT chain_pk PRIMARY KEY (chain_id);
 8   ALTER TABLE ONLY public.chain DROP CONSTRAINT chain_pk;
       public         postgres    false    176    176            �           2606    16488    pk_contactid 
   CONSTRAINT     S   ALTER TABLE ONLY contact
    ADD CONSTRAINT pk_contactid PRIMARY KEY (contact_id);
 >   ALTER TABLE ONLY public.contact DROP CONSTRAINT pk_contactid;
       public         postgres    false    178    178            �           2606    16529    pk_puser_ext 
   CONSTRAINT     ]   ALTER TABLE ONLY puser_extension
    ADD CONSTRAINT pk_puser_ext PRIMARY KEY (extension_id);
 F   ALTER TABLE ONLY public.puser_extension DROP CONSTRAINT pk_puser_ext;
       public         postgres    false    181    181            �           2606    16568 	   pk_tag_id 
   CONSTRAINT     H   ALTER TABLE ONLY tag
    ADD CONSTRAINT pk_tag_id PRIMARY KEY (tag_id);
 7   ALTER TABLE ONLY public.tag DROP CONSTRAINT pk_tag_id;
       public         postgres    false    172    172            �           2606    41530    pk_tagcomment_id 
   CONSTRAINT     [   ALTER TABLE ONLY tag_comment
    ADD CONSTRAINT pk_tagcomment_id PRIMARY KEY (comment_id);
 F   ALTER TABLE ONLY public.tag_comment DROP CONSTRAINT pk_tagcomment_id;
       public         postgres    false    182    182            �           2606    16518    session_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);
 >   ALTER TABLE ONLY public.session DROP CONSTRAINT session_pkey;
       public         postgres    false    180    180            �           2606    16427    tag_file_id_key 
   CONSTRAINT     J   ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_file_id_key UNIQUE (file_id);
 =   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_file_id_key;
       public         postgres    false    172    172            �           2606    16457    user_pk 
   CONSTRAINT     I   ALTER TABLE ONLY puser
    ADD CONSTRAINT user_pk PRIMARY KEY (user_id);
 7   ALTER TABLE ONLY public.puser DROP CONSTRAINT user_pk;
       public         postgres    false    173    173            �           2606    16466    fk_puc_chainid    FK CONSTRAINT     �   ALTER TABLE ONLY puser_chain
    ADD CONSTRAINT fk_puc_chainid FOREIGN KEY (chain_id) REFERENCES chain(chain_id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.puser_chain DROP CONSTRAINT fk_puc_chainid;
       public       postgres    false    176    1934    177            �           2606    16461    fk_puc_userid    FK CONSTRAINT     �   ALTER TABLE ONLY puser_chain
    ADD CONSTRAINT fk_puc_userid FOREIGN KEY (user_id) REFERENCES puser(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.puser_chain DROP CONSTRAINT fk_puc_userid;
       public       postgres    false    177    173    1932            �           2606    16530    fk_puser_ext_uid    FK CONSTRAINT     v   ALTER TABLE ONLY puser_extension
    ADD CONSTRAINT fk_puser_ext_uid FOREIGN KEY (user_id) REFERENCES puser(user_id);
 J   ALTER TABLE ONLY public.puser_extension DROP CONSTRAINT fk_puser_ext_uid;
       public       postgres    false    1932    181    173            �           2606    16607    fk_tag_chain_id    FK CONSTRAINT     �   ALTER TABLE ONLY tag
    ADD CONSTRAINT fk_tag_chain_id FOREIGN KEY (chain_id) REFERENCES chain(chain_id) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.tag DROP CONSTRAINT fk_tag_chain_id;
       public       postgres    false    1934    172    176            �           2606    16579    fk_tag_user_id    FK CONSTRAINT     h   ALTER TABLE ONLY tag
    ADD CONSTRAINT fk_tag_user_id FOREIGN KEY (user_id) REFERENCES puser(user_id);
 <   ALTER TABLE ONLY public.tag DROP CONSTRAINT fk_tag_user_id;
       public       postgres    false    172    1932    173            �           2606    16596    fk_user_chain_id    FK CONSTRAINT     v   ALTER TABLE ONLY puser
    ADD CONSTRAINT fk_user_chain_id FOREIGN KEY (default_chain_id) REFERENCES chain(chain_id);
 @   ALTER TABLE ONLY public.puser DROP CONSTRAINT fk_user_chain_id;
       public       postgres    false    173    1934    176               �   x�m�A
�0�����@e2I�f� x 7Z[������쾟7���>OW 4��PQ��0�l$E��>=�{�[���2O�ƚ]#R���,{�=t�<��e�K�H&M�>�q��E��r^�yo�� �Ɯb����z>(�^l8k            x������ � �         A   x�3�tO-*J�SN����42�V*�M��Q�RJ�+�KW�QP�I,JO
�e�+�r��qqq ��M         S   x�u��	�0��U�pН��V-鿎X���,
uo:g�#l

���p�i�p�`ZU#�k��b�؁�M�CD8�            x�K�(�O�
t+s���4����� X         U  x���Mo�@��
�g��#���(U)���AD�CA>���߫\ڃI�&��;�a,o�L5&�C�is",T��c�7B�3���	9q�.�O(N}��ّf;�e�D���=&~�fHF���$��Â����&t�h�牾�>�����@��o.O�|��,���r�|�}��1�B���ut�x}�Ǜq0,�!	�#+�t�����7�m����V��wZ��
n��
�U"'J��H����m�4Te�7+�nZEF�P��-p�U��B$N�#�L�1���(T���/�g�+Y� +���못%F�H����z�4�����p&|,���AV��[�[�}Fb��      
      x��\�n�H���~
�H� �̫Hz4l%N�؎/r�I�@(�ŋM�h^tɠ�~�����ϲ��O��T�%۲<Ӄ��4Y���;߹�iQ�O&�=�B�*����ro�MX؟R�TQP���{,��u {����Rg^g�_r�Ŵ�����z���\�R	rJyBII}�bR^Вf���B
��*�H��$������JJc_.�oX�zQƠsiф4��T�R��N��4P�P<��(.EE.�H]R�K��N(|��;�`� M�}"��x��B��:��2�7���HQaָ���˾tʠ����H��U��8k�k
$d��+�.�A��̋�ٲ��YS}(�q�K%�7]dXT�,���eP|ѝ3V�BH�P2�q��g	&%eح4gEE2�$kG'X�m�_��{�5��q����^vʊ;́�E��A�4�;�� ��kB+*��pF*�7��X)�^�;�����qb��
��.���+�0Κ�����e��{VI#�#�p��#&�q�KҐ���^����`�Ț������Ӭ^���Ǹ��.�c�墳���S����tg'����R�;�?���yw'�|:��W��f��I7c���*��"�j��z8�b���CBϞ.��̘�2���Z�����n1lbW65�i�᧚�Tn�a�Wu)7;Ɗ�T2�g>)|H�H�s�UT�nF�ہx��!+�2e��:�xA��4Ç~��;0R1���u��:���`"�a��	I:o�v0�[y$w�̂e]/Z$�%rB��>�II���XJ���.Zi�Ӣ��]�iA��r�j9�u:K8�|���v+� s�W�o��la� U|�=
��e����_v�O���3�ٷ-�ݝ�&M��}��-�5;�ږ	Yʜx����b_�ef9̊���j��S��bۋz��!6ż����ww�ÀO~���c���Ͱ����2РJ-ؚ��l���k��'�����һ~Z>_��ԗ�<{?�����{�*���I�N�ןχ���weg\.�X�N��l^�)-[�l�ʞ����I�=R�d�2�i��,�2�%>,$�y?���(E��~�˻{��x�_����IH_�̯�:���/��L.h^���x 3:-_݌��,�{�÷����qq"�)�	�$w. ���A��(?r�׉�
��oA��F�/q����Da��d)=�F�\P �u���@e.��AFq.��Af� �}�>@����?a.$>���7IL�M���(�����@���j:
bdr�2:�
d5�K�#�
^dS&j/h��Mi�i���P�R'��.�tu_�{�ݫ�g�*�cV�W�G�QY!��l�	�Ɣ�yCX��Yӡ.�`�D���ՀFy���C(�hJe��+5�<��.*Z)�����I�׋��e���<m����-���t���qMS��
�i����Z��ܩz�f�:���o?6ŷC9SU�ղ��l��@�nk��~�k����EǇ�tts�q�:1?�����Y��:���==��T-�͇q8ri��q�o K�;6�E ��#�=lY��rO3��nh��2(~�����@R�*��+i
D:�sG��o�g����������x{|aT�����OP$��hQ ��(���}	+�Қ+R�$�R�̩s�`�A;;��wZA6�rAZ�@��Kt�*�����OUx}��|��X*�m�/b#�f����=�BsֺR[ֻ�<�f%�*�l=�v�-��"�,�%��y��a����*9�}�fO�B���U�A`��vue3~�S!7�	B�8r�3d��U>�09����̇nA�,�I<ӬU<��@3k �L�<��`;��@�~p��� �f�a���y�.����`���h�.��md���rO�����[PPa��)<��I�7�R�4�j���XR��G�� & �A�7��!�&,�:���W})uT��ؕ��$.hݜ���"���!~��˹�A����'}�W�mc_\ȳ�*|ĊJ�W�]����s܎�s���&���c4B�=�T$�#)�DS��H�\�����z֘l�#���-ʩ��q�3��-��ߔ�'S����59n��E9��9c� Z���Gʴ|Kv�݁^�z�^Z��E��	��%��� ��G��J�1����<[�yIl3�{�:1[˹��7���b��$���4P3P��u(>��&7a��< ��8����V�����׸��h���h�\�E$J�jӂ*M���| $�g}{;���[%���Dw�_���������.���_#�lVr�=e���X�8��'t/CX0?Ѓ�8IP��d�
ˠ����+�Q�o�������F^�)迯����@O<�K����)�5�PE��gg�p�hi��h�L�m��Sڗn�y�./>&�#r�Eid��=�r�TP�`8-��%Ñ�J~A�B��"9@�@�S�A�� AH"Q����juA5.2����`�T��mJJ�ş�t�IIY]"��77F�]�c�����Ms�P���u�y�-��.�[�j�+꾢�4�7�T�������|j�X�݆�l��Z���g�����(�^5�9:O��>ǃ�������V�K��K�[����؇��i�sT�ߚ�|muX �_z���룷�7N��%~L߹dV�hZ}���ۧ��������mq>�.�7{�콲�|2�:��)���]ZT�J�Q)D�+(�8X�z7��N"Hr�'�_~���(���o^�j_x�(�V_:\+�j�p�����K_X-�d��;� �bXPxN滀U�T'0"8�@0笆��9�IL Z�E��y4/c�;�\4�	[d��	PL�xR��ߗ�����7��RxB�X�
N��8:k|K
W�>'�bNۡ��H	(�1b�� ��� �+X
���9�ǋ�V���"�70Z���, ,�4�p d�_�[mT�5g߰P�wB��ߌ��66Mg�;��fo��
�;0h)usU�h�VAm����x��0�T{U�yʌ�lT[�W�V<�l��T�V<�T�ɛ����$}gq|3���5
���f��3�c13f�6[x)�/�E��g��-*�[�T	О��(ȕa�&�)��M����*e)��ԗ�y9.���eh{?�U:.Y������J�Б
�%�"��`W&�WH�=���T�E^�� ����T�E&@n�u�ŉwi�`�$���υ��n����ARE<�����/�L�X��ɠ��mU�&��r
�@T�{�%/�򔕠�C�ꌂ��lB �\�+�@]��"��>;6N�I�)d���x��K'�0TtԣՀ�׀%� ��U��ϣ�ď}a�(3J�$hu~�9I��ȟo-A�|]f�8PΉ� �`�f�S_1!&(����Lg�C/��!�a��a�ꡯ��@�^A�%$���ͥ(��aV2i��~�%w������y�>����A�2
|J	l���S�'?CUu����M�(~P���quPw���4�wo��j�k?;��h���ӌ��Sz�jf�M���g3���C	�ge�z�/6��q�t�un�ɽ�j�~?�#w�-S����Z�Pn�y���/�A��+;O���荖��+(��Z��7*胇�%�K�P�@{B7����F7Gc+���^�{Ӗ�( �g�T�J��yX��������z}��o��&�V~�?e-�;��xst����[�����Iݣs*�~�\88{��́1��l��H��i�t.a����;2�d�U�ũ��@�����鄥.����zP�Y�O�B������J��(Ҍ2 �U���%�T�;U!� 3�'|�U@I�P#@�H�;�����s����U����S[X�W*0��H1�%�T`A ����x"�
����wz)-@8yȍ*%�\լ-��jNOS{�It����"><�p�����g����,�����f���5G���"$��*���P�(v��V��H`����ѥ� X  ���ќ�� ���t\�u9��l�f��؝�E���E|��h�ا��r�?G�@O[%�u�Nk�l�]?\�7�6�Focn4d�?��/�zŉ3�����&-�ο�ֻ�o7zu�����]vhz��u$%�X�q�v1�l���pPE~Ѫb�a���b���E; ���+h�:��E���{�X�!���GG�+�xy����uvv`؟�Z�w_��ُz��[�i��_�i�/�&���6KϯS������ �"�	(��Xa�ٛ�g��p�!:Vֱq�X�+s%|�U��^5���>R��g_�n�3������5�3yI�6�w�ȵU��-u�VǸI��ہEd�� �Î϶M��l�b"?�U�ͥ��L^ӓ7cC��f��+>���g�z66-ݶe�M���:�jF��h�\��K����w߅�)v��9�����ZU�xB���:d9V�E�R;Y\�TcӰ���ā��ݾ�x�\��9��[�e-�L����Z/�X+3I�k�R�7�-V��7�PKpM][�48j߰�6NR��]�ŝ�<�c\��lc�@����� ��7Us�ك�W�p��m���?�~.f�΍��[H����_O��N�.$�i�_	t�H�������X�������dp?�/aQY��z�u�T�:�C�?�Wŧ;'z��.`����s�����nMD��X=�8]�$t:g�9�'T.�`η��aA��=�J�`].�M`���.&xwr�,ޚ���uE! �/pY�2�~A��l[<�8�b.��:\��� 0"$���Q.�g16�6�꠻8�9|`�	������a\� X�����V K�vw>��|Z�ru��/"�S��)HS�����ʚ�������(x7Wޛ���Ca{�Kxt�/���"7P/��z}Gr5M6��TGStK��g];�'�O�r�7`����y�P�����=n�%�W'�8Q�|[0�ؓ�q�ID�)�>�R6nG�/�s��vvr>���_Ϳ�̓�����$��"��J�IO���t�G�]�$n÷�������h�����=�km�����jU�eF,ch�ߟ���-�6�ф�����jd��w���`uF~~�(g�p7ο$o����Oz���$8	��Suvފ��ި'��{�\|z�������FE/��Ġg�oZ9������M������u{��z�z��A�}a�b�4qxm��`gb���R�4$�|����_��ۯ����p�b�+(�M�9ʇ�<����R�h��u������T�6*�)Ѹ�ŅW��}=
�b�S4�b��KKhП��eD�\��NBHܗޓ$hM4Ǚ���Md^�`�$,hkyj��Y%�]��.Cs��� ���4LG���04Fį#�< ���̲��l���,$|�Rh?
0(�[���s�PP�;��V��muf^�ax��h;�0g'-�ޒW>lY���?�WK��@����0�L�����U�-�<�g�}fAPҪK���̰�U��8�n�o<��s�*.+֫7�[R�4���Ej�h��(�w���Q115P/.A�<*�V�.���uO�W�.g.	C +@���Ϫ+4 ������͆*��ҫk�t�-4'K���ә��W�&ve5�֖q+[G���n��?f,L���4����to�6H�ˡ���Go������a�Y�S2U����;7��O����Je�վ�i#:�7��`���! u�k��{%@{�q{uU��Vd�|�VTY���!����Ń�I�{�J�k�@�c�8W���j���uso6ӎU�}�*���1��,�m����>�v�{��85���dY>V���-��֐��)o}��㯖H���X��������9'x��z��;�4��d�D�E w�����]<k�S�k������l^{&��>��0�v�n�Q����� �X!q+��z���
PuE�l��<h�� {g9��<��y݀���i0��1p,�2^4:ne9���Z��m(��;�n:��kβNc��0�+��AّЭ�B��b����\we�S�V���%�Fa� �ǘ�Rz�"q�¤#t �pw�(�v��E�_%`%?�8CG�����5k𖳄S����w�r������7����Oڬ�IsE�sRt���	����8�o
��x{vksR\Lv$�{͊��&���ܙ@)����l�R�.ƁO�>C��8<n���� +���
Eܓ2me����j}Uu��X�*Yc��4�oi��Ù���M<�+kF���]%7��9�ŭ���� 7�����۶2�� ԅ-����Y�:����X���@��7�S-��|�,ho��������v�����������864�٫˽4.1�,^D1���vQ�.�{��PYŮ��H �śVq5��O��k[�P[�e2��؟��_�����K��N���K���o��^�ύo����h����Q[gs��aɽ����������t���.�^h��FD_/z�CΚ�w��|��2�j�?�2���l�r	�>��Ƽ�i1�R3[mP^�E�%<��W���@*�{808��r��~�&G\	�1ZD��!v�}�L����7��_��ڥ����`���%��EXs��K���$F�W7D0��Ж@n���26abܮA˒�B�w���j䯶�Y�z����Ssx;Rϼpp�Ͼ�����_$$���!�����N���º�F���9$�v7���&�<����3��b���ŵ~���ov���۰�������(��������oת�3�w�}����.)Θ�]Uݕ���=z�z�`�$��R�y���J_Xq'������}�s�����D�U         {  x���ۏ�8ş�_�jW�VjG`BB�C��ɍ�&aB.Z�2�.N�����f�ݎ4��<�������,���Q��� ���п�&4,G��)����"��W�䄂��FW���β?+4z�d4��!L(N�+�b<��`�1�&�U�u^����I�y��mN��t��5��^��i3B����F���6XeLR(xBeX��8�XH�ň��x�r'ޓ��n�ڎ�;��
�lO!�1d0��h\;Y��`�k�t�kv.�׋����,C=�!����DSJ`@�<�P�)���~>~Y4'�������cH�v�򷋧�`C1[J�c.$�9����D��T,���M>]�b�D�(��zJ� ���$+�w��.���{�Iu��>�I�Q�ýy~�����gǒC��G�2Xf%���P9�a�u�N��/��$��S G��)��J�B�N��Zf�ܻ���r��1lRH8���P�gL�n�xD�����?A��)Hh³�΁�0��s>��f�8�o�l�a�7�U�N�Ih��+c���1�J5L���� =���<Ý;7��m������������$ݭ�'���>o�e�6AI�T��Up�S¤J�z��/���\��+4��J���|�rk�9��p�G�������2���������}����x��z�U7��9���r��sYw
NEI3�&8gϜF�|�|�����f�eϡ��'R*��e*����{F����B�k�a!Ϩ�7LK	�'�gH�U?{J-n-_�#*T�~�5�8y�m���͍��e���u�A�qt��ӆ�5��j��펫o@�x\P2�����7��f�9���V5�㌩�������П�3��X��^Ӵ����     