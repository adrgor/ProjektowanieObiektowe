program BubbleSort;
var numbers: array [1..50] of integer;
i, j, a, b: integer;

procedure generateRandomNumbers(var arr: array of integer);
begin
        randomize();    
        for i := 0 to length(arr) do
                arr[i] := random(100);
end;

procedure bubbleSort(var arr: array of integer);
begin
        for i := 0 to length(arr)-1 do
        begin
                for j := 0 to length(arr)-1-i do
                begin
                        if (arr[j] > arr[j+1]) then
                        begin
                                a := arr[j];
                                b := arr[j+1];
                                arr[j] := b;
                                arr[j+1] := a;
                        end;
                end;
        end;

        for i := 0 to length(arr)-1 do
                writeln(arr[i]);
end;

begin
        generateRandomNumbers(numbers);
        bubbleSort(numbers);
end.
