function clean_picture = myremovecom(picture, n)
   seen = zeros(300, 500);
   for i = 1:300
       for j = 1:500
           if seen(i, j) == 0
                queue = zeros(2, 150000);
                front = 1;
                rear = 2;
                queue(:, 1) = [i; j];
                cnt = 1;
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
                                cnt = cnt + 1;
                                seen(iadj(k), jadj(k)) = 1;
                            end
                        end
                    end
                end
                if cnt < n
                    for idx = 1:rear-1
                        removeIdx = queue(:, idx);
                        removeIdxi = removeIdx(1, 1);
                        removeIdxj = removeIdx(2, 1);
                        picture(removeIdxi, removeIdxj) = 0;
                    end
                end
           end
       end
   end
   clean_picture = picture;
end