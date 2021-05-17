   ## usersテーブル
| Column         | Type   | Options                         |
| -------------- | ------ | ------------------------------- |
| nickname       | string | null: false, unique: true       |
| email          | string | null: false, unique: true       |
| password       | string | null: false                     |
| last_name      | string | null: false                     |
| first_name     | string | null: false                     |
| last_name_kana | string | null: false                     |
| first_name_kana| string | null: false                     |
| birthday       | date   | null: false                     |

### Association
has_many :items
has_many :addresses
has_many :orders

   ## itemsテーブル
| Column         | Type   | Options                         |
| -------------- | ------ | ------------------------------- |
| nickname       | string | null: false, unique: true       |
| email          | string | null: false, unique: true       |
| password       | string | null: false                     |
| last_name      | string | null: false                     |
| first_name     | string | null: false                     |
| last_name_kana | string | null: false                     |
| first_name_kana| string | null: false                     |
| birthday       | date   | null: false                     |



