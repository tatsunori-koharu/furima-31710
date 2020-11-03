# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| password             | string | null: false               |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| first_name_furigana  | string | null: false               |
| last_name            | string | null: false               |
| last_name_furigana   | string | null; false               |
| birthday             | date   | null: false               |

## Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_id      | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| user             | references | null: false, foreign_kye: true |

## Association 

- belongs_to :user
- has_one    :order

## order テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item              | references | null: false, foreign_kye: true |
| user              | references | null: false, foreign_kye: true |
| cerated_at        | datetime   | null: false                    |

## Association

- belongs_to :user
- belongs_to :item
- has_one    :street_address

## street_address

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | integer    | null: false                    |
| building_number_id | integer    |                                |
| phone_number       | integer    | null: false                    |
| order              | references | null: false, foreign_kye: true |

## Association

- belongs_to  :order