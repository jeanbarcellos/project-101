
-- ----------------------------
-- Records of role
-- ----------------------------

INSERT INTO "public"."role"("id", "description", "name", "created_at", "updated_at") VALUES ('93a879ab-fa9c-475e-8bb3-86d0bc4244a9', 'Perfil do desenvolvedor/empresa. gerentia TUDO, configurações, roles e utilitários.', 'root', '2022-02-20 15:56:37.939407', '2022-02-20 15:56:37.939407');
INSERT INTO "public"."role"("id", "description", "name", "created_at", "updated_at") VALUES ('fce7f4b5-a5a7-4ac3-bcb2-c7a270e8698e', 'Inclui, exclui, atualiza e visualiza usuários, perfils e outras funções administrativas', 'admin', '2022-02-20 15:56:46.011322', '2022-02-20 15:56:46.011322');
INSERT INTO "public"."role"("id", "description", "name", "created_at", "updated_at") VALUES ('983e702d-51ed-41c4-8f05-ee3fba2cdc26', 'Usuário padrão utilizador do sistema', 'default', '2022-02-20 15:56:46.425343', '2022-02-20 15:56:46.425343');


-- ----------------------------
-- Records of role_hierarchy
-- ----------------------------

-- Herança
INSERT INTO "public"."role_hierarchy"("parent_role_id", "child_role_id") VALUES ('93a879ab-fa9c-475e-8bb3-86d0bc4244a9', 'fce7f4b5-a5a7-4ac3-bcb2-c7a270e8698e');
INSERT INTO "public"."role_hierarchy"("parent_role_id", "child_role_id") VALUES ('fce7f4b5-a5a7-4ac3-bcb2-c7a270e8698e', '983e702d-51ed-41c4-8f05-ee3fba2cdc26');
-- Definição em geral
-- INSERT INTO "public"."role_hierarchy"("parent_role_id", "child_role_id") VALUES ('93a879ab-fa9c-475e-8bb3-86d0bc4244a9', 'fce7f4b5-a5a7-4ac3-bcb2-c7a270e8698e');
-- INSERT INTO "public"."role_hierarchy"("parent_role_id", "child_role_id") VALUES ('93a879ab-fa9c-475e-8bb3-86d0bc4244a9', '983e702d-51ed-41c4-8f05-ee3fba2cdc26');


-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "public"."user"("id", "email", "name", "password", "status", "created_at", "updated_at") VALUES ('824ca30a-a80b-4829-8af5-333b35c177b1', 'root@teste.com', 'Root/Programador', '$2a$10$rIw0H6cXzblKeHJuf9usfuNKDCIFrr2nFszv2uRI6QAhhKX6dyW5G', 1, '2022-02-20 15:57:47.840855', '2022-02-20 15:57:47.840855');
INSERT INTO "public"."user"("id", "email", "name", "password", "status", "created_at", "updated_at") VALUES ('d61ef95b-ff40-4c25-93d5-5caaae732494', 'admin001@teste.com', 'Administrador 001', '$2a$10$rIw0H6cXzblKeHJuf9usfuNKDCIFrr2nFszv2uRI6QAhhKX6dyW5G', 1, '2022-02-20 15:57:47.842465', '2022-02-20 15:57:47.842465');
INSERT INTO "public"."user"("id", "email", "name", "password", "status", "created_at", "updated_at") VALUES ('03324f77-322d-452a-8e84-5ad48c68a85f', 'admin002@teste.com', 'Administrador 002', '$2a$10$rIw0H6cXzblKeHJuf9usfuNKDCIFrr2nFszv2uRI6QAhhKX6dyW5G', 1, '2022-02-20 15:57:47.8437', '2022-02-20 15:57:47.8437');
INSERT INTO "public"."user"("id", "email", "name", "password", "status", "created_at", "updated_at") VALUES ('5770f2a0-0cce-48a9-8ccb-a97c2871f13f', 'admin003@teste.com', 'Administrador 003', '$2a$10$rIw0H6cXzblKeHJuf9usfuNKDCIFrr2nFszv2uRI6QAhhKX6dyW5G', 1, '2022-02-20 15:57:47.845014', '2022-02-20 15:57:47.845014');
INSERT INTO "public"."user"("id", "email", "name", "password", "status", "created_at", "updated_at") VALUES ('d29a680d-1e69-4ee7-a38f-ecb7717de755', 'usuario001@teste.com', 'Usuário 001', '$2a$10$rIw0H6cXzblKeHJuf9usfuNKDCIFrr2nFszv2uRI6QAhhKX6dyW5G', 1, '2022-02-20 15:57:47.848832', '2022-02-20 15:57:47.848832');
INSERT INTO "public"."user"("id", "email", "name", "password", "status", "created_at", "updated_at") VALUES ('4cad4f4f-12af-472e-ad7c-9be8ec083eb7', 'usuario002@teste.com', 'Usuário 002', '$2a$10$rIw0H6cXzblKeHJuf9usfuNKDCIFrr2nFszv2uRI6QAhhKX6dyW5G', 1, '2022-02-20 15:57:47.851461', '2022-02-20 15:57:47.851461');
INSERT INTO "public"."user"("id", "email", "name", "password", "status", "created_at", "updated_at") VALUES ('056abfa1-c6ff-419a-afc9-d59b6947209a', 'usuario003@teste.com', 'Usuário 003', '$2a$10$rIw0H6cXzblKeHJuf9usfuNKDCIFrr2nFszv2uRI6QAhhKX6dyW5G', 1, '2022-02-20 15:57:47.852933', '2022-02-20 15:57:47.852933');




-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO "public"."user_role" ("user_id", "role_id") VALUES ('824ca30a-a80b-4829-8af5-333b35c177b1', '93a879ab-fa9c-475e-8bb3-86d0bc4244a9');
INSERT INTO "public"."user_role" ("user_id", "role_id") VALUES ('d61ef95b-ff40-4c25-93d5-5caaae732494', 'fce7f4b5-a5a7-4ac3-bcb2-c7a270e8698e');
INSERT INTO "public"."user_role" ("user_id", "role_id") VALUES ('03324f77-322d-452a-8e84-5ad48c68a85f', 'fce7f4b5-a5a7-4ac3-bcb2-c7a270e8698e');
INSERT INTO "public"."user_role" ("user_id", "role_id") VALUES ('5770f2a0-0cce-48a9-8ccb-a97c2871f13f', 'fce7f4b5-a5a7-4ac3-bcb2-c7a270e8698e');
INSERT INTO "public"."user_role" ("user_id", "role_id") VALUES ('4cad4f4f-12af-472e-ad7c-9be8ec083eb7', '983e702d-51ed-41c4-8f05-ee3fba2cdc26');
INSERT INTO "public"."user_role" ("user_id", "role_id") VALUES ('056abfa1-c6ff-419a-afc9-d59b6947209a', '983e702d-51ed-41c4-8f05-ee3fba2cdc26');
INSERT INTO "public"."user_role" ("user_id", "role_id") VALUES ('d29a680d-1e69-4ee7-a38f-ecb7717de755', '983e702d-51ed-41c4-8f05-ee3fba2cdc26');



-- ----------------------------
-- Records of category
-- ----------------------------

INSERT INTO "public"."category" ("id", "name", "created_at", "updated_at") VALUES ('06867776-b52c-4a85-8815-14ee1552a559', 'Camisetas', '2022-02-14 08:05:56.281231', '2022-02-14 08:05:56.281231');
INSERT INTO "public"."category" ("id", "name", "created_at", "updated_at") VALUES ('18e5b82c-6c4c-42ef-ab9f-5f142ecd663e', 'Canecas', '2022-02-14 08:05:56.292126', '2022-02-14 08:05:56.292126');
INSERT INTO "public"."category" ("id", "name", "created_at", "updated_at") VALUES ('e55d2134-b9ae-4921-bf05-b084e29248e1', 'Adeviso', '2022-02-14 08:05:56.293571', '2022-02-14 08:05:56.293571');

-- ----------------------------
-- Records of product
-- ----------------------------

-- INSERT INTO "public"."product" ("id", "name", "description", "active", "value", "quantity", "image", "created_at", "updated_at", "category_id") VALUES ('0a988a84-3a2e-41bb-b8d7-7fb16a48cad0', 'Caneca Turn Coffe In Code', 'Descrição', 't', 15, 100, 'caneca3.jpg', '2021-02-27 17:10:21.116423', '2021-02-27 17:10:21.116423', '18e5b82c-6c4c-42ef-ab9f-5f142ecd663e');
-- INSERT INTO "public"."product" ("id", "name", "description", "active", "value", "quantity", "image", "created_at", "updated_at", "category_id") VALUES ('399a4305-1172-433a-891b-e0ac3857cde0', 'Caneca No Coffe No Code', 'Descrição', 't', 30, 100, 'caneca4.jpg', '2021-02-27 17:10:21.116423', '2021-02-27 17:10:21.116423', '18e5b82c-6c4c-42ef-ab9f-5f142ecd663e');
-- INSERT INTO "public"."product" ("id", "name", "description", "active", "value", "quantity", "image", "created_at", "updated_at", "category_id") VALUES ('82e966fe-806e-4395-97af-20bcf4f31733', 'Camiseta Debugar Preta', 'Descrição', 't', 110, 100, 'camiseta4.jpg', '2021-02-27 00:00:00', '2021-02-27 00:00:00', '06867776-b52c-4a85-8815-14ee1552a559');
-- INSERT INTO "public"."product" ("id", "name", "description", "active", "value", "quantity", "image", "created_at", "updated_at", "category_id") VALUES ('c498acc1-b622-4507-b3ff-64084325635e', 'Camiseta Code Life Preta', 'Descrição', 't', 90, 100, 'camiseta2.jpg', '2021-02-27 00:00:00', '2021-02-27 00:00:00', '06867776-b52c-4a85-8815-14ee1552a559');
-- INSERT INTO "public"."product" ("id", "name", "description", "active", "value", "quantity", "image", "created_at", "updated_at", "category_id") VALUES ('06867776-b52c-4a85-8815-14ee1552a559', 'Camiseta Sofware Developer', 'Descrição', 't', 100, 100, 'camiseta1.jpg', '2021-02-27 17:10:21.116423', '2021-02-27 17:10:21.116423', '06867776-b52c-4a85-8815-14ee1552a559');
-- INSERT INTO "public"."product" ("id", "name", "description", "active", "value", "quantity", "image", "created_at", "updated_at", "category_id") VALUES ('09c0e6b1-4763-4c77-bb92-ee3f68f8995e', 'Camiseta Code Life Cinza', 'Descrição', 't', 80, 100, 'camiseta3.jpg', '2021-02-27 17:08:52.913199', '2021-02-27 17:08:52.913199', '06867776-b52c-4a85-8815-14ee1552a559');
-- INSERT INTO "public"."product" ("id", "name", "description", "active", "value", "quantity", "image", "created_at", "updated_at", "category_id") VALUES ('55c0eb46-8eee-441d-afc6-a8ba3d2881df', 'Caneca Start Bugs', 'Descrição', 't', 25, 100, 'caneca1.jpg', '2021-02-27 17:10:21.116423', '2021-02-27 17:10:21.116423', '18e5b82c-6c4c-42ef-ab9f-5f142ecd663e');
-- INSERT INTO "public"."product" ("id", "name", "description", "active", "value", "quantity", "image", "created_at", "updated_at", "category_id") VALUES ('ac6deb27-e7c9-4169-99f9-787b28283573', 'Caneca Programmer Code', 'Descrição', 't', 15, 100, 'caneca2.jpg', '2021-02-27 17:14:35.909087', '2021-02-27 17:14:35.909087', '18e5b82c-6c4c-42ef-ab9f-5f142ecd663e');