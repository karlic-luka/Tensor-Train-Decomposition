function imena = StrStructPerm(cell)
    %helper function that permutates cell of strings
    %currently not in use
    n = numel(cell);
    ii = randperm(n);
    [~, previous_order] = sort(ii);
    imena = cell(ii);
end