function file_contents = readFile(filename)
fid = fopen(filename);
    file_contents = fscanf(fid, '%c', inf);
    fclose(fid);
end

