-- Ada Example Program
-- Input:    An integer, List_Len, where List_Len is less than 100,
--		followed by List_Len-integer values
-- Output:	The number of input values that are greater than the
--		average of all input values
with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;           use Ada.Integer_Text_IO;
procedure jdoodle is
	type Int_List_Type is array (1..99) of Integer;
	Int_List : Int_List_Type;
	List_Len, Sum, Average, Result : Integer;
    Integer_File : File_Type;
function Minimum (List:Int_List_Type; len: Integer) return Integer is
min:Integer;
begin
   min := List(1);
   for Index in 2 .. len loop
       if min > List(Index) then
          min := List(Index);
       end if;
   end loop;
   return min;
end Minimum;
begin
   Result := 0;
   Sum := 0;
   Open(Integer_File, In_File, "/uploads/input2.txt");
   Get (Integer_File, List_Len);
   skip_line(Integer_File);
    if (List_Len > 0) and (List_Len < 100) then
-- Read input data into an array and compute the sum
	    for Counter in 1 .. List_Len loop
	      Get (Integer_File, Int_List(Counter));
          skip_line(Integer_File);
          Put(Int_List(Counter));
          Put(" ");
	       Sum := Sum + Int_List(Counter);
	    end loop;
	    New_line;
-- Compute the average
	    Average := Sum / List_Len;
-- Count the number of values that are > average
	    for Counter in 1 .. List_Len loop
	       if Int_List(Counter) > Average then
		     Result := Result + 1;
	       end if;
        end loop;
-- Print result
	    Put ("The number of values > average is:");
	    Put (Result);
	    New_Line;
	    Put ("The average is ");
	    Put (Average);
	    New_line;
      else 
	    Put_Line ("Error-input list length is not legal");
    end if;
    Result := Minimum(Int_List, List_Len);
    Put("Minimum value is ");
    Put(Result);
    New_Line;
    Close(Integer_File);

end jdoodle;

