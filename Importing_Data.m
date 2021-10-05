function D = Importing_Data(filename)

%Creating an object opts.Import data through import options object
opts = delimitedTextImportOptions("NumVariables", 4);
%Defining the contents of the file
opts.VariableNames = ["PhiDot", "Phi", "Temp", "kf"];
opts.VariableTypes = ["double", "double", "double", "double"];
if (filename ~= "C60.csv")
    %Changing decimal operator to comma. Return opts.
    opts = setvaropts(opts, [1, 2, 3, 4], "DecimalSeparator", ",");
    %Incase a value is read as non-numeric
    opts = setvaropts(opts, [1, 2, 3, 4], "TrimNonNumeric", true);
end
%Read all rows of data starting from row 2 to end of file.
opts.DataLines = [2, Inf];
%Setting Data Delimiter
opts.Delimiter = ";";
%Making sure no extra column and no empty line exists.
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "error";
%Reading the file as type table
D = readtable(filename, opts);
%Converting the table into type array
D = table2array(D);
%Freeing up memory
clear opts;

end