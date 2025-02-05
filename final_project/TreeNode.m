classdef TreeNode
    properties
        children = [];
        parents = [];
        data;
        c;
        a;
        names;
    end

    methods
        function obj = TreeNode(names, c, a)
            obj.names = names;
            obj.data = zeros(1, length(names));
            obj.c = c;
            obj.a = a;
        end

        function obj = setChildren(obj, children)
            obj.children = children;
        end

        function obj = setParents(obj, parents)
            obj.parents = parents;
        end

        function is_leaf = isLeaf(obj)
            is_leaf = isempty(obj.children);
        end

        function has_children = hasChildren(obj)
            has_children = ~isempty(obj.children);
        end
    end
end