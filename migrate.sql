-- Migration: Tao bang links cho SnapLink
-- Chay 1 lan duy nhat de khoi tao database PostgreSQL (Docker / Aiven Cloud)
-- Thiet ke toi uu: `id` (VARCHAR(10)) la PRIMARY KEY truc tiep chua ma short code

CREATE TABLE IF NOT EXISTS links (
    id           VARCHAR(10)  PRIMARY KEY,                  -- Primary Key: 7-10 ky tu chuan Base64URL (RFC 4648 §5)
    original_url TEXT         NOT NULL,                     -- Duong dan URL dich day du (theo chuan RFC 3986)
    created_at   TIMESTAMPTZ  NOT NULL DEFAULT NOW()        -- Thoi gian tao ban ghi
);

-- Index ho tro query xoa link cu (cron cleanup) va sap xep theo thoi gian tao
CREATE INDEX IF NOT EXISTS idx_links_created_at ON links (created_at DESC);