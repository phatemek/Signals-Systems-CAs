function [L, Ne] = mysegmentation(picture)
    L = zeros(300, 500);
    seen = zeros(300, 500);
    Ne = 0;
    for j = 1:500
        for i = 1:300
           if seen(i, j) == 0 && picture(i, j) == 1
                queue = zeros(2, 150000);
                front = 1;
                rear = 2;
                queue(:, 1) = [i; j];
                seen(i, j) = 1;
                while rear > front
                    curr = queue(:, front);
                    front = front + 1;
                    curri = curr(1, 1);
                    currj = curr(2, 1);
                    iadj = [curri+1, curri, curri-1, curri+1, curri-1, curri+1, curri, curri-1];
                    jadj = [currj-1, currj-1, currj-1, currj, currj, currj+1, currj+1, currj+1];
                    for k = 1:8
                        if iadj(k) > 0 && iadj(k) <= 300 && jadj(k) > 0 && jadj(k) <= 500
                            if picture(iadj(k), jadj(k)) == picture(curri, currj) && seen(iadj(k), jadj(k)) == 0
                                queue(:, rear) = [iadj(k), jadj(k)];
                                rear = rear + 1;
                                seen(iadj(k), jadj(k)) = 1;
                            end
                        end
                    end
                end
                Ne = Ne + 1;
                for idx = 1:rear-1
                    labelIdx = queue(:, idx);
                    labelIdxi = labelIdx(1, 1);
                    labelIdxj = labelIdx(2, 1);
                    L(labelIdxi, labelIdxj) = Ne;
               end
           end
       end
    end
end