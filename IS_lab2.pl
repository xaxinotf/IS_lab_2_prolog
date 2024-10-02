% Директиви для уникнення помилок discontiguous
:- discontiguous is_a/2.
:- discontiguous part_of/2.

% Декларуємо is_a/2 та part_of/2 як таблировані предикати
:- table is_a/2.
:- table part_of/2.

% Родо-видові зв'язки (is_a)
is_a(vehicle, transport_means).
is_a(land_vehicle, vehicle).
is_a(water_vehicle, vehicle).
is_a(air_vehicle, vehicle).

is_a(car, land_vehicle).
is_a(motorcycle, land_vehicle).
is_a(truck, land_vehicle).

is_a(sedan, car).
is_a(suv, car).

is_a(sport_bike, motorcycle).
is_a(cruiser, motorcycle).

is_a(pickup_truck, truck).
is_a(lorry, truck).

is_a(boat, water_vehicle).
is_a(ship, water_vehicle).

is_a(sailboat, boat).
is_a(motorboat, boat).

is_a(cargo_ship, ship).
is_a(cruise_ship, ship).

is_a(airplane, air_vehicle).
is_a(helicopter, air_vehicle).

is_a(jet_airplane, airplane).
is_a(propeller_airplane, airplane).

is_a(attack_helicopter, helicopter).
is_a(transport_helicopter, helicopter).

% Зв'язки частина-ціле (part_of)
part_of(engine, car).
part_of(wheels, car).
part_of(doors, car).

part_of(piston, engine).
part_of(cylinder, engine).

part_of(tire, wheels).
part_of(rim, wheels).

part_of(wings, airplane).
part_of(airplane_engine, airplane).

part_of(hull, boat).
part_of(hull, ship).

part_of(rotor, helicopter).
part_of(tail_rotor, helicopter).

% Правила виведення

% Транзитивність родо-видових зв'язків
is_a(X, Z) :- 
    is_a(X, Y), 
    is_a(Y, Z).

% Транзитивність зв'язків частина-ціле
part_of(X, Z) :- 
    part_of(X, Y), 
    part_of(Y, Z).

% Правило: Якщо X є частиною Y, а Y є видом Z, то X є частиною Z
part_of(X, Z) :- 
    part_of(X, Y), 
    is_a(Y, Z).

% Правило: Якщо X є видом Y, а Y є частиною Z, то X є частиною Z
part_of(X, Z) :- 
    is_a(X, Y), 
    part_of(Y, Z).
