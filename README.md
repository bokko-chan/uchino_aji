# README

# Table design
## users

| Column             | Type       | Options     |
|:-------------------|:-----------|:------------|
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| birthday           | date       | null: false |
| favorite_dish      | text       |             |
| profile            | text       |             |

### Association

- has_one :seasoning

## seasonings

| Column        | Type       | Options                        |
|:--------------|:-----------|:-------------------------------|
| user_id       | references | null: false, foreign_key: true |
| salt_sugar_id | integer    |                                |
| soy_sauce_id  | integer    |                                |
| liquor_id     | integer    |                                |
| miso_id       | integer    |                                |
| dashi_id      | integer    |                                |
| oil_id        | integer    |                                |
| vinegar_id    | integer    |                                |
| sauce_id      | integer    |                                |
| western_id    | integer    |                                |
| chinese_id    | integer    |                                |
| spice_herb_id | integer    |                                |
| roux_id       | integer    |                                |
| dressing_id   | integer    |                                |
| other_id      | integer    |                                |

### Association

- belongs_to :users