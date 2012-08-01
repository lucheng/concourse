/**
 * Copyright    : Copyright(C) 2000-2009. HIT-CIR. All Rights Reserved
 * File Summary : AutoPrompt Function
 * Author       : Fandywang 
 * Create time  : 2009-12-13
 * Project Name : yuetan
 * Version      : 1.0
 */
package edu.hit.irlab.yuetan.autosuggest.ds.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Queue;

import edu.hit.irlab.yuetan.autosuggest.Keyword;

/**
 * Implementation for Radix tree {@link RadixTree}.
 * 
 * @author Tahseen Ur Rehman (tahseen.ur.rehman {at.spam.me.not} gmail.com)
 * @author Javid Jamae
 * @author Dennis Heidsiek
 * @author Fandywang
 */
public class RadixTreeImpl<T> implements RadixTree<T> {

	/** The root. */
	protected RadixTreeNode<T> root;

	/** The size. */
	protected long size;

	/**
	 * Create a Radix Tree with only the default node root.
	 */
	public RadixTreeImpl() {
		root = new RadixTreeNode<T>();
		root.setKey("");
		size = 0;
	}

	/* (non-Javadoc)
	 * @see edu.hit.irlab.yuetan.ds.tree.RadixTree#find(java.lang.String)
	 */
	public T find(String key) {
		Visitor<T, T> visitor = new VisitorImpl<T, T>() {

			public void visit(String key, RadixTreeNode<T> parent,
					RadixTreeNode<T> node) {
				if (node.isReal())
					result = node.getValue();
			}
		};

		visit(key, visitor);

		return visitor.getResult();
	}

	/* (non-Javadoc)
	 * @see edu.hit.irlab.yuetan.ds.tree.RadixTree#delete(java.lang.String)
	 */
	public boolean delete(String key) {
		Visitor<T, Boolean> visitor = new VisitorImpl<T, Boolean>(Boolean.FALSE) {
			public void visit(String key, RadixTreeNode<T> parent,
					RadixTreeNode<T> node) {
				result = node.isReal();

				// if it is a real node
				if (result) {
					// If there no children of the node we need to
					// delete it from the its parent children list
					if (node.getChildern().size() == 0) {
						Iterator<RadixTreeNode<T>> it = parent.getChildern()
								.iterator();
						while (it.hasNext()) {
							if (it.next().getKey().equals(node.getKey())) {
								it.remove();
								break;
							}
						}

						// if parent is not real node and has only one child
						// then they need to be merged.
						if (parent.getChildern().size() == 1
								&& parent.isReal() == false) {
							mergeNodes(parent, parent.getChildern().get(0));
						}
					} else if (node.getChildern().size() == 1) {
						// we need to merge the only child of this node with
						// itself
						mergeNodes(node, node.getChildern().get(0));
					} else { // we jus need to mark the node as non real.
						node.setReal(false);
					}
				}
			}

			/**
			 * Merge a child into its parent node. Operation only valid if it is
			 * only child of the parent node and parent node is not a real node.
			 * 
			 * @param parent
			 *            The parent Node
			 * @param child
			 *            The child Node
			 */
			private void mergeNodes(RadixTreeNode<T> parent,
					RadixTreeNode<T> child) {
				parent.setKey(parent.getKey() + child.getKey());
				parent.setReal(child.isReal());
				parent.setValue(child.getValue());
				parent.setChildern(child.getChildern());
			}

		};

		visit(key, visitor);

		if (visitor.getResult()) {
			size--;
		}
		return visitor.getResult().booleanValue();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see ds.tree.RadixTree#insert(java.lang.String, java.lang.Object)
	 */
	public void insert(String key, T value) throws DuplicateKeyException {
		try {
			insert(key, root, value);
		} catch (DuplicateKeyException e) {
			// re-throw the exception with 'key' in the message
			throw new DuplicateKeyException("Duplicate key: '" + key + "'");
		}
		size++;
	}

	/**
	 * Recursively insert the key in the radix tree.
	 * 
	 * @param key The key to be inserted
	 * @param node The current node
	 * @param value The value associated with the key
	 * 
	 * @throws DuplicateKeyException If the key already exists in the database.
	 */
	private void insert(String key, RadixTreeNode<T> node, T value)
			throws DuplicateKeyException {

		int numberOfMatchingCharacters = node
				.getNumberOfMatchingCharacters(key);

		// we are either at the root node
		// or we need to go down the tree
		if (node.getKey().equals("") == true
				|| numberOfMatchingCharacters == 0
				|| (numberOfMatchingCharacters < key.length() && numberOfMatchingCharacters >= node
						.getKey().length())) {
			boolean flag = false;
			String newText = key.substring(numberOfMatchingCharacters, key
					.length());
			for (RadixTreeNode<T> child : node.getChildern()) {
				if (child.getKey().startsWith(newText.charAt(0) + "")) {
					flag = true;
					insert(newText, child, value);
					break;
				}
			}

			// just add the node as the child of the current node
			if (flag == false) {
				RadixTreeNode<T> n = new RadixTreeNode<T>();
				n.setKey(newText);
				n.setReal(true);
				n.setValue(value);

				node.getChildern().add(n);
			}
		}
		// there is a exact match just make the current node as data node
		else if (numberOfMatchingCharacters == key.length()
				&& numberOfMatchingCharacters == node.getKey().length()) {
			if (node.isReal() == true) {
				throw new DuplicateKeyException("Duplicate key");
			}

			node.setReal(true);
			node.setValue(value);
		}
		// This node need to be split as the key to be inserted
		// is a prefix of the current node key
		else if (numberOfMatchingCharacters > 0
				&& numberOfMatchingCharacters < node.getKey().length()) {
			RadixTreeNode<T> n1 = new RadixTreeNode<T>();
			n1.setKey(node.getKey().substring(numberOfMatchingCharacters,
					node.getKey().length()));
			n1.setReal(node.isReal());
			n1.setValue(node.getValue());
			n1.setChildern(node.getChildern());

			node.setKey(key.substring(0, numberOfMatchingCharacters));
			node.setReal(false);
			node.setChildern(new ArrayList<RadixTreeNode<T>>());
			node.getChildern().add(n1);

			if (numberOfMatchingCharacters < key.length()) {
				RadixTreeNode<T> n2 = new RadixTreeNode<T>();
				n2.setKey(key.substring(numberOfMatchingCharacters, key
						.length()));
				n2.setReal(true);
				n2.setValue(value);

				node.getChildern().add(n2);
			} else {
				node.setValue(value);
				node.setReal(true);
			}
		}
		// this key need to be added as the child of the current node
		else {
			RadixTreeNode<T> n = new RadixTreeNode<T>();
			n.setKey(node.getKey().substring(numberOfMatchingCharacters,
					node.getKey().length()));
			n.setChildern(node.getChildern());
			n.setReal(node.isReal());
			n.setValue(node.getValue());

			node.setKey(key);
			node.setReal(true);
			node.setValue(value);

			node.getChildern().add(n);
		}
	}

	/* (non-Javadoc)
	 * @see edu.hit.irlab.yuetan.ds.tree.RadixTree#searchPrefix(java.lang.String, int)
	 */
	public ArrayList<T> searchPrefix(String prefix, int recordLimit) {
		ArrayList<T> keys = new ArrayList<T>();

		RadixTreeNode<T> node = searchPrefix(prefix, root, new int[1]);

		if (node != null) {
			if (node.isReal()) {
				keys.add(node.getValue());
			}
			getNodes(node, keys, recordLimit);
		}

		return keys;
	}

	/**
	 * Gets the nodes.
	 * 
	 * @param parent the parent
	 * @param keys the keys
	 * @param limit the limit
	 * 
	 * @return the nodes
	 */
	private void getNodes(RadixTreeNode<T> parent, ArrayList<T> keys, int limit) {
		Queue<RadixTreeNode<T>> queue = new LinkedList<RadixTreeNode<T>>();

		queue.addAll(parent.getChildern());

		while (!queue.isEmpty()) {
			RadixTreeNode<T> node = queue.remove();
			if (node.isReal() == true) {
				keys.add(node.getValue());
			}

			if (keys.size() == limit) {
				break;
			}

			queue.addAll(node.getChildern());
		}
	}

	/**
	 * Search prefix.
	 * 
	 * @param key the key
	 * @param node the node
	 * @param rest the rest
	 * 
	 * @return the radix tree node< t>
	 */
	private RadixTreeNode<T> searchPrefix(String key, RadixTreeNode<T> node,
			int[] rest) {
		RadixTreeNode<T> result = null;

		int numberOfMatchingCharacters = node
				.getNumberOfMatchingCharacters(key);

		if (numberOfMatchingCharacters == key.length()
				&& numberOfMatchingCharacters <= node.getKey().length()) {
			result = node;
			rest[0] = numberOfMatchingCharacters; // 辅助
		} else if (node.getKey().equals("") == true
				|| (numberOfMatchingCharacters < key.length() && numberOfMatchingCharacters >= node
						.getKey().length())) {
			String newText = key.substring(numberOfMatchingCharacters, key
					.length());
			for (RadixTreeNode<T> child : node.getChildern()) {
				if (child.getKey().startsWith(newText.charAt(0) + "")) {
					result = searchPrefix(newText, child, rest);
					break;
				}
			}
		}

		return result;
	}

	/* (non-Javadoc)
	 * @see edu.hit.irlab.yuetan.ds.tree.RadixTree#searchPrefixNodes(java.lang.String)
	 */
	public Map<String, T> searchPrefixNodes(String prefix) {
		// Index rest = new Index(-1);
		int[] rest = new int[1];
		RadixTreeNode<T> node = searchPrefix(prefix, root, rest);
		Map<String, T> keys = new HashMap<String, T>();

		if (node != null) {
			StringBuilder k = new StringBuilder(prefix);
			if (rest[0] >= 0)
				k.append(node.getKey().substring(rest[0]));
			if (node.isReal())
				keys.put(k.toString(), node.getValue());
			bfsNodes(k.toString(), node, keys);
		}

		return keys;
	}

	/**
	 * Bfs nodes.
	 * 
	 * @param prefix the prefix
	 * @param parent the parent
	 * @param keys the keys
	 */
	private void bfsNodes(String prefix, RadixTreeNode<T> parent,
			Map<String, T> keys) {

		for (RadixTreeNode<T> children : parent.getChildern()) {
			StringBuilder k = new StringBuilder();
			k.append(prefix).append(children.getKey());

			if (children.isReal())
				keys.put(k.toString(), children.getValue());

			bfsNodes(k.toString(), children, keys);
		}
	}

	/**
	 * Search prefix nodes.
	 * 
	 * @param prefix the prefix
	 * @param keys the keys
	 * 
	 * @author Fandywang
	 */
	@SuppressWarnings("unchecked")
	public void searchPrefixNodes(String prefix, PriorityQueue<Keyword> keys) {
		// Index rest = new Index(-1);
		int[] rest = new int[1];
		RadixTreeNode<ArrayList<Keyword>> node = (RadixTreeNode<ArrayList<Keyword>>) searchPrefix(
				prefix, root, rest);

		if (node != null) {
			StringBuilder k = new StringBuilder(prefix);
			if (rest[0] >= 0)
				k.append(node.getKey().substring(rest[0]));
			if (node.isReal()) {
				/*for (int i = 0; i < node.getValue().size(); i++) {
					keys.offer((Keyword) node.getValue().get(i));
				}*/
				// 小根最大堆，大小保证在10个以内
				for (int i = 0; i < node.getValue().size(); i++) {
					if (keys.size() >= 10) {
						int valueMin = keys.peek().getVaule();
						if (valueMin < node.getValue().get(i).getVaule()) {
							keys.poll();
							keys.offer(node.getValue().get(i));
						}
					} else
						keys.offer(node.getValue().get(i));
				}
			}
			bfsNodes(k.toString(), node, keys);
		}
	}

	/**
	 * Bfs nodes.
	 * 
	 * @param prefix the prefix
	 * @param parent the parent
	 * @param keys the keys
	 * 
	 * @author Fandywang
	 */
	private void bfsNodes(String prefix,
			RadixTreeNode<ArrayList<Keyword>> parent,
			PriorityQueue<Keyword> keys) {

		for (RadixTreeNode<ArrayList<Keyword>> children : parent.getChildern()) {
			StringBuilder k = new StringBuilder();
			k.append(prefix).append(children.getKey());

			if (children.isReal()) {
				// 小根最大堆，大小保证在10个以内
				for (int i = 0; i < children.getValue().size(); i++) {
					if (keys.size() >= 10) {
						int valueMin = keys.peek().getVaule();
						if (valueMin < children.getValue().get(i).getVaule()) {
							keys.poll();
							keys.offer(children.getValue().get(i));
						}
					} else
						keys.offer(children.getValue().get(i));
				}
			}

			bfsNodes(k.toString(), children, keys);
		}
	}

	/* (non-Javadoc)
	 * @see edu.hit.irlab.yuetan.ds.tree.RadixTree#contains(java.lang.String)
	 */
	public boolean contains(String key) {
		Visitor<T, Boolean> visitor = new VisitorImpl<T, Boolean>(Boolean.FALSE) {
			public void visit(String key, RadixTreeNode<T> parent,
					RadixTreeNode<T> node) {
				result = node.isReal();
			}
		};

		visit(key, visitor);

		return visitor.getResult().booleanValue();
	}

	/**
	 * visit the node those key matches the given key.
	 * 
	 * @param key The key that need to be visited
	 * @param visitor The visitor object
	 */
	public <R> void visit(String key, Visitor<T, R> visitor) {
		if (root != null) {
			visit(key, visitor, null, root);
		}
	}

	/**
	 * recursively visit the tree based on the supplied "key". calls the Visitor
	 * for the node those key matches the given prefix
	 * 
	 * @param prefix The key o prefix to search in the tree
	 * @param visitor The Visitor that will be called if a node with "key" as its
	 * key is found
	 * @param node The Node from where onward to search
	 * @param parent the parent
	 */
	private <R> void visit(String prefix, Visitor<T, R> visitor,
			RadixTreeNode<T> parent, RadixTreeNode<T> node) {

		int numberOfMatchingCharacters = node
				.getNumberOfMatchingCharacters(prefix);

		// if the node key and prefix match, we found a match!
		if (numberOfMatchingCharacters == prefix.length()
				&& numberOfMatchingCharacters == node.getKey().length()) {
			visitor.visit(prefix, parent, node);
		} else if (node.getKey().equals("") == true // either we are at the
				// root
				|| (numberOfMatchingCharacters < prefix.length() && numberOfMatchingCharacters >= node
						.getKey().length())) { // OR we need to
			// traverse the childern
			String newText = prefix.substring(numberOfMatchingCharacters,
					prefix.length());
			for (RadixTreeNode<T> child : node.getChildern()) {
				// recursively search the child nodes
				if (child.getKey().startsWith(newText.charAt(0) + "")) {
					visit(newText, visitor, node, child);
					break;
				}
			}
		}
	}

	/* (non-Javadoc)
	 * @see edu.hit.irlab.yuetan.ds.tree.RadixTree#getSize()
	 */
	public long getSize() {
		return size;
	}

}
