drop table recipes cascade constraints;
drop table meal_plan cascade constraints;
drop table ingredients cascade constraints;
drop table recipe_ingredients cascade constraints;
drop table current_fridge cascade constraints;


create table recipes(
    recipe_name varchar2(50) primary key,
    category varchar2(25),
    instructions varchar2(2000)
);

create table meal_plan(
    dat date primary key,
    day_of_week varchar2(50),
    breakfast varchar2(50),
    lunch varchar2(50),
    dinner varchar2(50),
    foreign key(breakfast) references recipes(recipe_name),
    foreign key(lunch) references recipes(recipe_name),
    foreign key(dinner) references recipes(recipe_name)
);

create table ingredients(
    ingredient_name varchar2(50) primary key,
    group_of varchar2(25),
    calories number(4),
    sugar number(3),
    protein number(2),
    sodium number(4),
    fat number(2),
    unit varchar2(25)
);

create table recipe_ingredients(
    rec varchar2(50),
    ing varchar2(50),
    num_need number(2),
    foreign key(rec) references recipes(recipe_name),
    foreign key(ing) references ingredients(ingredient_name)
);

create table current_fridge(
    ingredientName varchar2(50) references ingredients(ingredient_name),
    num_left number(2)
);


insert into recipes values ('Grilled Cheese Sandwich', 'Lunch', 'Step1: Take two slices of...');
insert into recipes values ('Chicken Soup', 'Dinner', 'Step1: Take two slices of...');
insert into recipes values ('Scrambled Egg', 'Breakfast', 'Step1: Take two slices of...');

insert into ingredients values ('Bread', 'Grain', 50, 8, 0, 30, 5, 'slices');
insert into ingredients values ('Cheese', 'Dairy', 50, 8, 0, 30, 5, 'slices');
insert into ingredients values ('Butter', 'Fats', 50, 8, 0, 30, 5, 'Tbspn');
insert into ingredients values ('Beef', 'Meat', 50, 8, 0, 30, 5, 'lbs');
insert into ingredients values ('Chicken', 'Meat', 50, 8, 0, 30, 5, 'lbs');
insert into ingredients values ('Milk', 'Dairy', 50, 8, 0, 30, 5, 'lbs');
insert into ingredients values ('Carrots', 'Vegetables', 50, 8, 0, 30, 5, 'pieces');
insert into ingredients values ('Chicken Stock', 'Meat', 50, 8, 0, 30, 5, 'Cups');
insert into ingredients values ('Eggs', 'Meat', 50, 8, 0, 30, 5, '');

insert into recipe_ingredients values ('Grilled Cheese Sandwich', 'Bread');
insert into recipe_ingredients values ('Grilled Cheese Sandwich', 'Cheese');
insert into recipe_ingredients values ('Grilled Cheese Sandwich', 'Butter');
insert into recipe_ingredients values ('Chicken Soup', 'Chicken');
insert into recipe_ingredients values ('Chicken Soup', 'Carrots');
insert into recipe_ingredients values ('Chicken Soup', 'Chicken Stock');
insert into recipe_ingredients values ('Scrambled Egg', 'Eggs');
insert into recipe_ingredients values ('Scrambled Egg', 'Butter');

insert into current_fridge values ('Bread', 12);
insert into current_fridge values ('Cheese', 8);
insert into current_fridge values ('Butter', 6);
insert into current_fridge values ('Beef', 2);

