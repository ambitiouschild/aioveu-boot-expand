-- =============================================
-- 常用查询示例
-- =============================================

-- 查询用户关联的商户及角色
SELECT
    u.user_id,
    u.name,
    m.merchant_name,
    m.merchant_code,
    um.is_owner,
    GROUP_CONCAT(r.name) as role_names
FROM `user` u
         JOIN user_merchant um ON u.user_id = um.user_id
         JOIN merchant m ON um.merchant_id = m.merchant_id
         LEFT JOIN merchant_user_role mur ON u.user_id = mur.user_id AND m.merchant_id = mur.merchant_id
         LEFT JOIN roles r ON mur.role_id = r.role_id
WHERE u.user_id = 10001
  AND u.is_enable = 1
  AND u.is_del = 0
  AND um.is_enable = 1
  AND m.is_enable = 1
GROUP BY u.user_id, u.name, m.merchant_id, m.merchant_name, m.merchant_code, um.is_owner;

-- 查询商户员工列表及权限
SELECT
    ms.staff_no,
    ms.real_name,
    ms.department,
    ms.position,
    GROUP_CONCAT(DISTINCT r.name) as roles,
    GROUP_CONCAT(DISTINCT p.code) as permissions
FROM merchant_staff ms
         JOIN merchant_user_role mur ON ms.user_id = mur.user_id AND ms.merchant_id = mur.merchant_id
         JOIN roles r ON mur.role_id = r.role_id
         JOIN role_permission rp ON r.role_id = rp.role_id
         JOIN permissions p ON rp.permission_id = p.permission_id
WHERE ms.merchant_id = 1
  AND ms.status = 1
  AND ms.is_enable = 1
  AND mur.is_active = 1
GROUP BY ms.id, ms.staff_no, ms.real_name, ms.department, ms.position;

-- 权限验证查询
SELECT DISTINCT p.code
FROM permissions p
         JOIN role_permission rp ON p.permission_id = rp.permission_id
         JOIN merchant_user_role mur ON rp.role_id = mur.role_id
WHERE mur.user_id = 10001
  AND mur.merchant_id = 1
  AND mur.is_active = 1
  AND p.is_enable = 1;