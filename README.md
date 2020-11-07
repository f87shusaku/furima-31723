設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_k       | string | null: false |
| family_name_k      | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :items
- has_many :purchases
- has_many :multiple_addresses

## items テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| item_name       | string      | null: false                    |
| item_comment    | text        | null: false                    |
| category_id     | integer     | null: false                    |
| status_id       | integer     | null: false                    |
| burden_id       | integer     | null: false                    |
| prefecture_id  | integer     | null: false                    |
| days_to_ship_id | integer     | null: false                    |
| price           | integer     | null: false                    |
| user            | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :multiple_addresses

## multiple_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase