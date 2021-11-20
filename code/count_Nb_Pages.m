% Find from a path to a folder the number of documents (number of pages)

function n = count_Nb_Pages(path)
    a = dir(fullfile(path, '*.txt'));
    n = numel(a);
end