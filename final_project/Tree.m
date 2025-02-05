classdef Tree
    properties
        nodes = {};
    end
    
    methods
        function obj = Tree()
            % init all nodes
            obj.nodes{1} = TreeNode({'x1', 'x2', 'x3', 'x4'}, [54.13, 21.56, 34.08, 49.19], [1.25, 1.25, 1.25, 1.25]);
            obj.nodes{2} = TreeNode({'x5', 'x6'}, [33.03, 21.84], [1.25, 1.5]);
            obj.nodes{3} = TreeNode({'x7', 'x8'}, [29.96, 24.87], [1.5, 1.5]);
            obj.nodes{4} = TreeNode({'x9', 'x10'}, [47.24, 33.67], [1.5, 1.5]);
            obj.nodes{5} = TreeNode({'x11', 'x12', 'x13'}, [26.89, 32.76, 39.98], [1, 1, 1]);
            obj.nodes{6} = TreeNode({'x14', 'x15'}, [37.12, 53.83], [1, 1]);
            obj.nodes{7} = TreeNode({'x17'}, 59.73, 1);
            obj.nodes{8} = TreeNode({'x16'}, 61.65, 1);
            % set children
            obj.nodes{1}.setChildren([obj.nodes{2}, obj.nodes{3}, obj.nodes{4}, obj.nodes{5}]);
            obj.nodes{2}.setChildren([obj.nodes{6}, obj.nodes{8}]);
            obj.nodes{3}.setChildren([obj.nodes{5}, obj.nodes{6}]);
            obj.nodes{4}.setChildren([obj.nodes{5}, obj.nodes{7}]);
            obj.nodes{5}.setChildren([obj.nodes{6}, obj.nodes{7}]);
            obj.nodes{6}.setChildren(obj.nodes{8});
            % set parents
            obj.nodes{2}.setParents(obj.nodes{1});
            obj.nodes{3}.setParents(obj.nodes{1});
            obj.nodes{4}.setParents(obj.nodes{1});
            obj.nodes{5}.setParents([obj.nodes{1}, obj.nodes{3}, obj.nodes{4}]);
            obj.nodes{6}.setParents([obj.nodes{2}, obj.nodes{3}, obj.nodes{5}]);
            obj.nodes{7}.setParents([obj.nodes{4}, obj.nodes{5}]);
            obj.nodes{8}.setParents([obj.nodes{2}, obj.nodes{6}]);
        end

        function arr = to_array(obj)
            arr = [];
            for i = 1:length(obj.nodes)
                arr =[arr, obj.nodes{i}.data];
            end
        end
    end
end