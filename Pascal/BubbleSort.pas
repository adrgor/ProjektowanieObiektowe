program BubbleSort;
var numbers: array [1..50] of integer;
i, j, temp, a, b: integer;
begin
        randomize();
        for i := 0 to 49 do
                numbers[i] := random(100);

        for i := 0 to 49 do
        begin
                for j := 0 to 49-i do
                begin
                        if (numbers[j] > numbers[j+1]) then
                        begin
                                a := numbers[j];
                                b := numbers[j+1];
                                numbers[j] := b;
                                numbers[j+1] := a;
                        end;
                end;
        end;

        for i := 0 to 49 do
                writeln(numbers[i])
end.
