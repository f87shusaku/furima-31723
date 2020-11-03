設計

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| birth_year  | integer | null: false |
| birth_month | integer | null: false |
| birth_day   | integer | null: false |

### Association
- has_many :items
- has_many :purchases
- has_many :multiple_addresses

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| listing_name | string     | null: false                    |
| item_name    | string     | null: false                    |
| item_comment | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| burden       | string     | null: false                    |
| prefectures  | string     | null: false                    |
| days_to_ship | string     | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| purchase_name        | string     | null: false                    |
| purchase_day         | string     | null: false                    |
| purchase_item        | string     | null: false                    |
| user_id              | references | null: false, foreign_key: true |
| item_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_many :multiple_addresses

## multiple_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |
| purchase_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase