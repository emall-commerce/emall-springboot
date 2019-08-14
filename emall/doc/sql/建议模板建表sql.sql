CREATE TABLE `NewTable` (
`id`  int NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`create_by`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人' ,
`update_by`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改人' ,
`create_date`  datetime NOT NULL COMMENT '创建时间' ,
`update_date`  datetime NOT NULL COMMENT '修改时间' ,
`delete_flag`  char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标志Y已删除，N未删除' ,
`status_flag`  char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT '有效状态标志' ,
PRIMARY KEY (`id`)
)
;

