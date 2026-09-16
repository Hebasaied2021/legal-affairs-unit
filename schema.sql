CREATE TABLE IF NOT EXISTS records (
  id TEXT PRIMARY KEY,
  documentType TEXT,
  department TEXT,
  subject TEXT,
  relatedParty TEXT,
  issuingAuthority TEXT,
  legalBasis TEXT,
  documentDate TEXT,
  dueDate TEXT,
  reminderDays INTEGER,
  action TEXT,
  notes TEXT,
  registeredBy TEXT,
  registeredAt TEXT,
  attachments TEXT
);

CREATE TABLE IF NOT EXISTS departments (
  name TEXT PRIMARY KEY
);

INSERT OR IGNORE INTO departments (name) VALUES
  ('الإدارة القانونية'),
  ('الموارد البشرية'),
  ('الشؤون المالية'),
  ('تقنية المعلومات'),
  ('المشتريات'),
  ('لجنة التحقيق');

CREATE TABLE IF NOT EXISTS users (
  id TEXT PRIMARY KEY,
  username TEXT UNIQUE,
  passwordHash TEXT,
  salt TEXT,
  fullName TEXT,
  role TEXT,        -- 'admin' | 'editor' | 'viewer'
  department TEXT,  -- optional: restricts editor/viewer to one department; empty = all
  active INTEGER DEFAULT 1,
  createdAt TEXT
);

CREATE TABLE IF NOT EXISTS sessions (
  token TEXT PRIMARY KEY,
  userId TEXT,
  expiresAt TEXT
);

-- Default admin account — username: admin / password: ChangeMe123!
-- CHANGE THIS PASSWORD IMMEDIATELY after your first login (Settings → Change password).
INSERT OR IGNORE INTO users (id, username, passwordHash, salt, fullName, role, department, active, createdAt)
VALUES (
  'seed-admin-0001',
  'admin',
  'ef541142466ac43165724d356d6ae6902d20a67c886785a390eb7ac8748ce808',
  '216efed842a1fd3f921ecad79689fcf8',
  'مدير النظام',
  'admin',
  '',
  1,
  '2026-01-01T00:00:00.000Z'
);

