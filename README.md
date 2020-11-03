# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| first_name           | string | null: false |
| first_name_furigana  | string | null: false |
| family_name          | string | null: false |
| family_name_furigana | string | null; false |
| birthday             | date   | null: false |

## Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| price       | integer    | null: false                    |
| explanation | text       | null: false                    |
| user        | references | null: false, foreign_kye: true |

## Association 

- belongs_to :user
- has_one    :order

## order テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| price          | integer    | null: false                    |
| postal_code    | integer    | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | integer    | null: false                    |
| phone_number   | integer    | null: false                    |
| item           | references | null: false, foreign_kye: true |
| user           | references | null: false, foreign_kye: true |

## Association

- belongs_to :user
- has_one    :item
